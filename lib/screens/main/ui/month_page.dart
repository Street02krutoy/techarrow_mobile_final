import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class MonthPage extends StatefulWidget {
  const MonthPage({super.key});

  @override
  State<MonthPage> createState() => _MonthPageState();
}

class _MonthPageState extends State<MonthPage> {
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
              firstDay: DateTime.fromMillisecondsSinceEpoch(0),
              lastDay: DateTime.fromMillisecondsSinceEpoch(2641031200000),
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
          ]..addAll(
              List.generate(
                tasks.length,
                (int index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
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
              ).toList(),
            ),
        ),
      ),
    );
  }
}
