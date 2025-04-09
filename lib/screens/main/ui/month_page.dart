import 'dart:math';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class MonthPage extends StatefulWidget {
  const MonthPage({super.key, required this.isCalendarOpened});

  final bool Function() isCalendarOpened;

  @override
  State<MonthPage> createState() => _MonthPageState();
}

class _MonthPageState extends State<MonthPage> {
  bool flag = false;

  final List<String> months = [
    'янв',
    'фев',
    'мар',
    'апр',
    'май',
    'июн',
    'июл',
    'авг',
    'сен',
    'окт',
    'ноя',
    'дек'
  ];
  final List<String> weekdays = ['пн', ' вт', ' ср', 'чт', ' пт', ' сб', ' вс'];

  final List tasks = [
    {"task": "AKSJJSKKKSkksslsls", "isSolved": false},
    {"task": "sadfka;slfkasfd", "isSolved": false},
    {
      "task":
          "skdgjksljf;lksjfsjflksjflksjfslkfjslkfjslkfjslkfjslkfjslkfjslkfjslfjslfsfsajfaf",
      "isSolved": false
    },
    {"task": "l;sakdkmbsfsfsf", "isSolved": false},
    {"task": "kfjddlksdjglskfdjlsfkj", "isSolved": false},
    {"task": "kfjddlksdjglskfdjlsfkj", "isSolved": false},
    {"task": "kfjddlksdjglskfdjlsfkj", "isSolved": false},
    {"task": "kfjddlksdjglskfdjlsfkj", "isSolved": false},
    {"task": "kfjddlksdjglskfdjlsfkj", "isSolved": false},
    {"task": "kfjddlksdjglskfdjlsfkj", "isSolved": false},
    {"task": "kfjddlksdjglskfdjlsfkj", "isSolved": false},
    {"task": "kfjddlksdjglskfdjlsfkj", "isSolved": false},
    {"task": "kfjddlksdjglskfdjlsfkj", "isSolved": false},
    {"task": "kfjddlksdjglskfdjlsfkj", "isSolved": false},
  ];

  static DateTime _focusedDay = DateTime.now();
  static DateTime _selectedDay = DateTime.now();
  final CalendarFormat _calendarFormat = CalendarFormat.month;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15.0,
        right: 15.0,
        bottom: 20.0,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TableCalendar(
              locale: "ru_RU",
              focusedDay: _focusedDay,
              currentDay: _selectedDay,
              onHeaderTapped: (focusedDay) {
                setState(() {
                  _selectedDay = DateTime.now();
                  _focusedDay = DateTime.now();
                });
              },
              firstDay: DateTime.fromMillisecondsSinceEpoch(0),
              lastDay: DateTime.fromMillisecondsSinceEpoch(2641031200000),
              startingDayOfWeek: StartingDayOfWeek.monday,
              calendarFormat: _calendarFormat,
              availableCalendarFormats: const {CalendarFormat.month: ""},
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _focusedDay = focusedDay;
                  _selectedDay = selectedDay;
                });
              },
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "${_selectedDay.day} ${months[_selectedDay.month - 1]}, ${weekdays[_selectedDay.weekday - 1]}"
                  .toUpperCase(),
              style: TextStyle(
                fontSize: 22,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ]
            ..addAll(List.generate(
              widget.isCalendarOpened() ? tasks.length : 3,
              (int index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  onTap: () {
                    setState(
                      () {
                        tasks[index]["isSolved"] = !tasks[index]["isSolved"];
                      },
                    );
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: Theme.of(context).dividerColor,
                    ),
                  ),
                  leading: Checkbox(
                    value: tasks[index]["isSolved"],
                    onChanged: (value) {
                      setState(() {
                        tasks[index]["isSolved"] = value;
                      });
                    },
                  ),
                  title: Text(
                    tasks[index]["task"],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ).toList())
            ..add(
              Padding(
                padding: const EdgeInsets.only(
                  top: 30.0,
                  bottom: 10,
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: OutlinedButton(
                    style: ButtonStyle(
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => _taskSelectDialog(context));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.add,
                          size: 32,
                          color: Theme.of(context).primaryColor,
                        ),
                        Text(
                          "Добавить задачи на ${_selectedDay.day} ${months[_selectedDay.month - 1]}",
                          style: TextStyle(
                            fontSize: 19,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ),
      ),
    );
  }

  AlertDialog _taskSelectDialog(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Новые задачи на ${_selectedDay.day.toString().padLeft(2, "0")}.${(_selectedDay.month).toString().padLeft(2, "0")}.${_selectedDay.year}",
        style: TextStyle(
          fontSize: 22,
        ),
        textAlign: TextAlign.center,
      ),
      content: SizedBox(
        width: MediaQuery.of(context).size.width / 5 * 4,
        height:
            min(tasks.length * 40, MediaQuery.of(context).size.height / 5 * 3),
        child: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (BuildContext context, int index) => ListTile(
            onTap: () {},
            leading: Checkbox(
              value: flag,
              onChanged: (value) {},
            ),
            title: Text(
              tasks[index]["task"],
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
      actionsPadding: EdgeInsets.only(
        bottom: 10,
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 5 * 3,
          child: OutlinedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              "OK",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        )
      ],
    );
  }
}
