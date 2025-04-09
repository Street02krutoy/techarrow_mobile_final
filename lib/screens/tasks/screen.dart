import 'package:flutter/material.dart';
import 'package:techarrow_mobile_final/screens/tasks/ui/task_card_widget.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen>
    with TickerProviderStateMixin {
  late TabController tabController;

  int page = 0;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      setState(() {
        page = tabController.index;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Задачи"),
        bottom: TabBar(controller: tabController, tabs: const [
          Tab(text: "Незапланнированные"),
          Tab(text: "Запланнированные"),
          Tab(text: "Выполненные")
        ]),
      ),
      body: Center(
          child: SingleChildScrollView(
              child: ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    if (index == 4) {
                      return Center(
                          child: Text(
                        "Большая задача",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ));
                    }
                    return TaskCardWidget(
                        onTap: () {},
                        onEditTapped: page == 2 ? null : () {},
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Task ${index + 1}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Text("05:00"),
                          ],
                        ));
                  },
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: 10))),
    );
  }
}
