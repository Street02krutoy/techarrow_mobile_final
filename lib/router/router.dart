import 'package:flutter/material.dart';
import 'package:techarrow_mobile_final/screens/main/screen.dart';
import 'package:techarrow_mobile_final/screens/main/ui/add_task_page.dart';
import 'package:techarrow_mobile_final/screens/welcome/screen.dart';

class ApplicationRouter {
  Map<String, Widget Function(BuildContext)> routes = {
    "/": (context) => const MainScreen(),
    "/welcome": (context) => const WelcomeScreen(),
    "/add_task": (context) => const AddTaskPage(),
  };
}
