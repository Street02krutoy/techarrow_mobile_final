import 'package:techarrow_mobile_final/auth/keycloak.dart';
import 'package:techarrow_mobile_final/screens/main/ui/day_page.dart';
import 'package:techarrow_mobile_final/screens/main/ui/month_page.dart';
import 'package:techarrow_mobile_final/screens/main/ui/week_page.dart';

class MainScreenFeatures {
  final pages = [const DayPage(), const WeekPage(), const MonthPage()];

  Future<void> logout() async {
    Keycloak().logout();
  }

  Future<ApplicationUserInfo> getUserInfo() async {
    return Keycloak().getUserInfo();
  }

  void createTask(BuildContext context) {
    Navigator.of(context).pushNamed('/create_task');
  }
}
