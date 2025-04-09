import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class MonthPage extends StatefulWidget {
  const MonthPage({super.key});

  @override
  State<MonthPage> createState() => _MonthPageState();
}

class _MonthPageState extends State<MonthPage> {
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  final CalendarFormat _calendarFormat = CalendarFormat.month;
  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: "ru_RU",
      focusedDay: DateTime.now(),
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
    );
  }
}
