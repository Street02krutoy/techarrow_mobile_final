import 'package:anim_side_menu/anim_side_menu.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:techarrow_mobile_final/auth/keycloak.dart';
import 'package:techarrow_mobile_final/screens/main/features/main_screen_features.dart';
import 'package:techarrow_mobile_final/screens/main/ui/day_page.dart';
import 'package:techarrow_mobile_final/screens/main/ui/home_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();

  toggleMenu() {
    setState(() {
      if (isMenuOpened()) {
        _sideMenuKey.currentState!.closeSideMenu();
      } else {
        _sideMenuKey.currentState!.openSideMenu();
      }
    });
  }

  bool isMenuOpened() => _sideMenuKey.currentState!.isOpened;

  @override
  Widget build(BuildContext context) {
    return SideMenu(
        key: _sideMenuKey,
        type: SideMenuType.slide,
        onClosedIcon: () {
          toggleMenu();
        },
        background: Theme.of(context).primaryColor,
        menu: buildMenu(),
        closeIcon: const Icon(
          Icons.close_rounded,
          size: 30.0,
          color: Colors.white,
        ),
        animatedDuration: Duration(milliseconds: 1500),
        child: HomePage(
          toggleMenu: toggleMenu,
          isMenuOpened: isMenuOpened,
        ));
  }

  Widget buildMenu() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 80.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.account_circle,
                size: 30.0, color: Colors.white),
            title: const Text(
              "Профиль",
              style: TextStyle(fontSize: 22),
            ),
            textColor: Colors.white,
            dense: true,
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.home, size: 30.0, color: Colors.white),
            title: const Text(
              "Запланировать задачи",
              style: TextStyle(fontSize: 22),
            ),
            textColor: Colors.white,
            dense: true,
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.verified_user,
                size: 30.0, color: Colors.white),
            title: const Text(
              "Выполненные задачи",
              style: TextStyle(fontSize: 22),
            ),
            textColor: Colors.white,
            dense: true,
          ),
        ],
      ),
    );
  }
}
