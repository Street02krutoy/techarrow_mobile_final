import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:techarrow_mobile_final/utils/matrix.dart';
import 'package:techarrow_mobile_final/utils/matrixTools.dart';

List<Color> colors = [Colors.red, Colors.blue, Colors.green];

class DayPage extends StatefulWidget {
  const DayPage({super.key});

  @override
  State<DayPage> createState() => _DayPageState();
}

class _DayPageState extends State<DayPage> {

  int n = 1;

  Matrix matrix =  Matrix();

  @override
  Widget build(BuildContext context) {
    matrix.setMatrix(createEmpty(10, 10));

    Random random = Random();

    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Column(
      children: [
        SizedBox(height: height * 0.2),
        SizedBox(
          height: height * 0.2,
          width: width * 0.8,
          child: GestureDetector(
            onTapDown: (details) => {
              print(matrix.numberOnXY(details.localPosition, 0, 0))
            },
            child: CustomPaint(
              key: ValueKey(matrix.matrix),
              painter: matrix,
            ),
          ),
        ),
        Row(
          children: [
            TextButton(onPressed: () => {moveLeftShape(matrix.matrix, n)}, child: Text("Left")),
            TextButton(onPressed: () => {moveDownShape(matrix.matrix, n)}, child: Text("down")),
            TextButton(onPressed: () => {moveRightShape(matrix.matrix, n)}, child: Text("Right")),
            TextButton(onPressed: () => {addShape(matrix.matrix, random.nextInt(5) + 1, colors[random.nextInt(colors.length)], ++n)}, child: Text("add")),
          ],
        )
      ]
    );
  }
}

