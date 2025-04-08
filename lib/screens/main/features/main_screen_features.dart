import 'package:techarrow_mobile_final/auth/keycloak.dart';

class MainScreenFeatures {
  Future<void> logout() async {
    Keycloak().logout();
  }

  Future<UserInfo> getUserInfo() async {
    return Keycloak().getUserInfo();
  }
}
