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
    super.initState();
  }

  static int _page = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        if (details.primaryDelta! > 0 && !widget.isMenuOpened()) {
          widget.toggleMenu();
        }
        if (details.primaryDelta! < 0 && widget.isMenuOpened()) {
          widget.toggleMenu();
        }
      },
      child: Scaffold(
        appBar: AppBar(
            // bottom: ,
            leading: !widget.isMenuOpened()
                ? IconButton(
                    onPressed: widget.toggleMenu, icon: const Icon(Icons.menu))
                : null,
            centerTitle: true,
            title: Text("Ваши задачи")),
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
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed("/add_task");
          },
          tooltip: "Создать новую задачу",
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
