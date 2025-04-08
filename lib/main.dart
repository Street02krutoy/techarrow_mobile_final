import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:techarrow_mobile_final/auth_legacy/keycloak.dart';
import 'package:techarrow_mobile_final/router/router.dart';
import 'package:techarrow_mobile_final/screens/welcome/screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(const MainApp(
    initialRoute: '/welcome',
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key, required this.initialRoute});

  final String initialRoute;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: initialRoute,
      routes: ApplicationRouter().routes,
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => const WelcomeScreen());
      },
    );
  }
}
