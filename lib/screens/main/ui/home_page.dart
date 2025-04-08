import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:techarrow_mobile_final/auth/keycloak.dart';
import 'package:techarrow_mobile_final/screens/main/features/main_screen_features.dart';
import 'package:techarrow_mobile_final/screens/main/ui/day_page.dart';

class HomePage extends StatefulWidget {
  const HomePage(
      {super.key, required this.toggleMenu, required this.isMenuOpened});

  final void Function() toggleMenu;
  final bool Function() isMenuOpened;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final _features = MainScreenFeatures();

  late final TabController _tabbarController;

  @override
  void initState() {
    _tabbarController =
        TabController(initialIndex: _page, length: 3, vsync: this);
    data = _features.getUserInfo();
    super.initState();
  }

  Future<ApplicationUserInfo> data =
      Future.value(ApplicationUserInfo(id: "", username: ""));

  int _page = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // bottom: ,
        leading: !widget.isMenuOpened()
            ? IconButton(
                onPressed: widget.toggleMenu, icon: const Icon(Icons.menu))
            : null,
        centerTitle: true,
        title: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text('Привет, ${snapshot.data!.username}');
            }
            return const Text("Привет, user");
          },
          future: data,
        ),
        actions: [
          IconButton(
              onPressed: () => _features.logout().then(
                    (value) {
                      if (context.mounted) {
                        Navigator.of(context).pushReplacementNamed('/welcome');
                      }
                    },
                  ),
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Center(
          child: Column(
        children: [
          TabBar(
            controller: _tabbarController,
            tabs: const [
              Tab(text: "День"),
              Tab(text: "Неделя"),
              Tab(text: "Месяц"),
            ],
            onTap: (value) {
              setState(() {
                _page = value;
              });
            },
          ),
          _features.pages[_tabbarController.index],
        ],
      )),
    );
  }
}
