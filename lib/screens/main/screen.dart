import 'package:flutter/material.dart';
import 'package:techarrow_mobile_final/auth/keycloak.dart';
import 'package:techarrow_mobile_final/auth_legacy/keycloak.dart';
import 'package:techarrow_mobile_final/screens/main/features/main_screen_features.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _features = MainScreenFeatures();
  @override
  void initState() {
    data = _features.getUserInfo();
    super.initState();
  }

  Future<UserInfo> data = Future.value(UserInfo(id: "", username: ""));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder(
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text('Welcome, ${snapshot.data!.username}!');
              }
              return const Text("Welcome, user!");
            },
            future: data,
          ),
          ElevatedButton(
              onPressed: () => _features.logout().then(
                    (value) {
                      if (context.mounted) {
                        Navigator.of(context).pushReplacementNamed('/welcome');
                      }
                    },
                  ),
              child: const Text("Logout"))
        ],
      )),
    );
  }
}
