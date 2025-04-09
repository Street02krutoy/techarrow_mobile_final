import 'dart:async';
import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:techarrow_mobile_final/utils/matrix.dart';
import 'package:techarrow_mobile_final/utils/matrixTools.dart';
import 'package:techarrow_mobile_final/utils/task.dart';

List<Color> colors = [Colors.red, Colors.blue, Colors.green];

class DayPage extends StatefulWidget {
  const DayPage({super.key});

  @override
  State<DayPage> createState() => _DayPageState();
}

class _DayPageState extends State<DayPage> {
  List<Task> tasks = [
    Task(0, "awd", "awd", 0, 2, 0, 3),
    Task(1, "awd", "awd", 0, 2, 0, 2),
    Task(2, "awd", "awd", 0, 2, 0, 4)
  ];

  int rows = 10;
  int counter = 10;
  int index = 0;
  late Task temp;

  Matrix matrix =  Matrix();

  int n = 1;

  void startTimer(List<Task> curTasks, int rows) {
    
    const int time = 500;

    counter = rows;
    index = 0;

    
    final timer = Timer.periodic(Duration(milliseconds: time), (timer) {setState(() {
      update(timer);
    });});
  }

  void update(Timer timer){
    print("counter " + counter.toString());
    if (counter < rows) {
      moveDownShape(matrix.matrix, n);
      counter++;
    } else {
      if (index == tasks.length){
        print("cancel");
        timer.cancel();
      }
      else{
        n += 1;
        counter = 0;
        temp = tasks[index];
        index++;
        addShape(matrix.matrix, temp.len, colors[temp.colorId], n);
      }
    }
    matrix.isRepaint++;
  }

  @override
  void initState() {
    matrix.setMatrix(createEmpty(10, 10));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Random random = Random();

    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Column(
      children: [
        SizedBox(height: height * 0.2),
        SizedBox(
          height: height * 0.5,
          width: width * 0.8,
          child: GestureDetector(
            onTapDown: (details) => {
              print(matrix.numberOnXY(details.localPosition, 0, 0))
            },
            child: CustomPaint(
              key: ValueKey(matrix.isRepaint),
              painter: matrix,
            ),
          ),
        ),
        Row(
          children: [
            TextButton(onPressed: () => {moveLeftShape(matrix.matrix, n)}, child: Text("Left")),
            TextButton(onPressed: () => {moveDownShape(matrix.matrix, n)}, child: Text("down")),
            TextButton(onPressed: () => {moveRightShape(matrix.matrix, n)}, child: Text("Right")),
            TextButton(onPressed: () => {startTimer(tasks, 10)}, child: Text("start")),
          ],
        )
      ]
    );
  }
}

