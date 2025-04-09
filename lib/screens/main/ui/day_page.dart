import 'dart:async';
import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
    Task(2, "red", "awd", 0, 2, 0, 3),
    Task(3, "green", "awawdawdd", 0, 2, 2, 3),
    Task(4, "blue", "123123123", 0, 2, 1, 4),
    Task(5, "red", "awd", 0, 2, 0, 3),
    Task(6, "green", "awawdawdd", 0, 2, 2, 3),
    Task(7, "blue", "123123123", 0, 2, 1, 4)
  ];

  int rows = 10;
  int columns = 10;
  bool counter = false;
  int index = 0;
  late Task temp;
  Set<int> alreadyFilledLines = {};

  Matrix matrix = Matrix();

  int n = 1;
  Timer? timer;

  void startTimer(List<Task> curTasks) {
    const int time = 500;

    counter = false;
    index = 0;
    n = 1;
    matrix.matrix = createEmpty(rows, columns);
    matrix.isRepaint = 0;

    timer = Timer.periodic(Duration(milliseconds: time), (timer) {
      setState(() {
        update(timer);
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void update(Timer timer) {
    if (!counter) {
      if (index == tasks.length) {
        print("cancel");
        timer.cancel();
      } else {
        temp = tasks[index];
        counter = true;
        index++;

        n += 1;
        addShape(matrix.matrix, temp.len, colors[temp.colorId], n);
      }
    }
    if (!moveDownShape(matrix.matrix, n)) {
      counter = false;
      if (isFilledLine(matrix.matrix, alreadyFilledLines)) {
        Fluttertoast.showToast(
            msg: "совет",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      }
      print("counter $counter");
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
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    Task task;

    return Center(
      child: Column(children: [
        SizedBox(
          height: height * 0.05,
        ),
        SizedBox(
          height: height * 0.5,
          width: width * 0.8,
          child: GestureDetector(
            onTapDown: (details) => {
              task = tasks[
                  matrix.numberOnXY(details.localPosition, 0, 0).number - 2],
              if (matrix.numberOnXY(details.localPosition, 0, 0).number != 0)
                {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(task.title),
                        content: Text(task.description),
                        actions: <Widget>[
                          TextButton(
                              child: Text('Delete task'),
                              onPressed: () {
                                setState(() {
                                  deleteNumber(matrix.matrix, task.id);
                                  moveDownAllShapes(matrix.matrix);
                                  matrix.isRepaint++;
                                });
                                Navigator.of(context).pop();
                              }),
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  )
                }
            },
            child: CustomPaint(
              key: ValueKey(matrix.isRepaint),
              painter: matrix,
            ),
          ),
        ),
        if (timer?.isActive == true)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () => {moveLeftShape(matrix.matrix, n)},
                  icon: Icon(Icons.arrow_left, size: 100)),
              IconButton(
                  onPressed: () => {moveDownShape(matrix.matrix, n)},
                  icon: Icon(Icons.arrow_drop_down, size: 100)),
              IconButton(
                  onPressed: () => {moveRightShape(matrix.matrix, n)},
                  icon: Icon(
                    Icons.arrow_right,
                    size: 100,
                  )),
            ],
          )
        else
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              onTap: () => {startTimer(tasks)},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.green,
                ),
                child: Icon(
                  Icons.arrow_right,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),
          )
      ]),
    );
  }
}

void showAlertDialog(BuildContext context, Task task, List<List<Cell>> matrix) {
  ;
}
