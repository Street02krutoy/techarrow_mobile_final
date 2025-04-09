import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_week_view/flutter_week_view.dart';

class WeekPage extends StatefulWidget {
  const WeekPage({super.key});

  @override
  State<WeekPage> createState() => _WeekPageState();
}

class _WeekPageState extends State<WeekPage> {
  final days = [
    "Понедельник",
    "Вторник",
    "Среда",
    "Четверг",
    "Пятница",
    "Суббота",
    "Воскресенье"
  ];

  @override
  Widget build(BuildContext context) {
    return WeekView(
      userZoomable: true,
      controller: WeekViewController(minZoom: 0.4, maxZoom: 0.4),
      dayBarStyleBuilder: (date) {
        return DayBarStyle(
          dateFormatter: (year, month, day) {
            // get week day frm year month and day
            String weekDay = days[DateTime(year, month, day).weekday - 1];
            return "$weekDay, $day";
          },
        );
      },
      dates: List.generate(7, (index) {
        return DateTime.now().add(Duration(days: index));
      }),
    );
  }
}
