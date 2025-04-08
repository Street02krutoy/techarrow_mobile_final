import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:openid_client/openid_client_io.dart';
import 'package:url_launcher/url_launcher.dart';

class Keycloak {
  final String baseUrl = dotenv.env['KEYCLOAK_URL'] ?? '';
  final String realm = dotenv.env['REALM'] ?? '';
  final String clientId = dotenv.env['CLIENT_ID'] ?? '';
  final storage = const FlutterSecureStorage();

  Future<void> login() async {
    var issuer = await Issuer.discover(Uri.parse("$baseUrl/realms/$realm"));

    var client = Client(issuer, clientId);

    var authenticator = Authenticator(
      client,
      scopes: ['openid'],
      port: 4000,
      urlLancher: (url) async {
        Uri uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        }
      },
    );

    var credentials = await authenticator.authorize();

    await closeInAppWebView();
    var tokenInfo = await credentials.getTokenResponse();

    var userInfo = await credentials.getUserInfo();

    await storage.write(key: "access_token", value: tokenInfo.accessToken);
    await storage.write(key: "refresh_token", value: tokenInfo.refreshToken);
    await storage.write(
        key: "expires_in", value: tokenInfo.expiresIn.toString());

    await storage.write(
        key: "logout_uri", value: credentials.generateLogoutUrl().toString());

    await storage.write(key: "user_id", value: userInfo["sub"]);
    await storage.write(key: "username", value: userInfo["preferred_username"]);
  }

  void logout() async {
    final url = await storage.read(key: "logout_uri");
    Uri uri = Uri.parse(url!);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
      await closeInAppWebView();
      await storage.deleteAll();
    }
  }

  Future<UserInfo> getUserInfo() async {
    final userId = await storage.read(key: "user_id");
    final username = await storage.read(key: "username");
    if (userId == null || username == null) {
      return UserInfo(id: "", username: "");
    }
    return UserInfo(id: userId, username: username);
  }
}

class UserInfo {
  String id;
  String username;

  UserInfo({required this.id, required this.username});

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(id: json['sub'], username: json['preferred_username']);
  }

  Map<String, dynamic> toJson() => {'sub': id, 'preferred_username': username};
}
