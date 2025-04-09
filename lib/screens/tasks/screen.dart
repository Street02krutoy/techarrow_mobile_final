import 'package:flutter/material.dart';
import 'package:techarrow_mobile_final/screens/tasks/ui/dropdown.dart';
import 'package:techarrow_mobile_final/screens/tasks/ui/task_card_widget.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  void initState() {
    super.initState();
  }

  final dropdowns = [
    Dropdown(
        button: TaskCardWidget(
          child: Text(
            "Незапланированные",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        controller: ValueNotifier<bool>(false),
        children: [
          ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, i) => TaskCardWidget(
                  onTap: () {},
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Task ${i + 1}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text("05:00"),
                    ],
                  )),
              separatorBuilder: (context, index) => SizedBox(height: 10),
              itemCount: 3)
        ]),
    Dropdown(
        button: TaskCardWidget(
          child: Text(
            "Запланированные",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        controller: ValueNotifier<bool>(false),
        children: [
          ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, i) => TaskCardWidget(
                  onTap: () {},
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Task ${i + 1}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text("05:00"),
                    ],
                  )),
              separatorBuilder: (context, index) => SizedBox(height: 10),
              itemCount: 3)
        ]),
    Dropdown(
        button: TaskCardWidget(
          child: Text(
            "Выполненные",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        controller: ValueNotifier<bool>(false),
        children: [
          ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, i) => TaskCardWidget(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Task ${i + 1}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text("05:00"),
                    ],
                  )),
              separatorBuilder: (context, index) => SizedBox(height: 10),
              itemCount: 3)
        ]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Задачи"),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) => dropdowns[index],
          itemCount: dropdowns.length),
    );
  }
}
