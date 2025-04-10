import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:techarrow_mobile_final/auth/keycloak.dart';
import 'package:techarrow_mobile_final/swagger_generated_api/client_index.dart';

class ApiService {
  final api = Swagger.create(
      baseUrl: Uri.parse('http://192.168.168.29:5252'),
      interceptors: [AuthInterceptor()]);
}

class AuthInterceptor implements HeadersInterceptor {
  AuthInterceptor();

  @override
  Map<String, String> get headers => {'Authorization': "Bearer token"};

  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(
      Chain<BodyType> chain) async {
    if (await Keycloak().isTokenExpired()) {
      await Keycloak().refreshToken();
    }
    chain.request.headers['Authorization'] =
        'Bearer ${await FlutterSecureStorage().read(key: "access_token")}';
    return chain.proceed(chain.request);
  }
}
