import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:techarrow_mobile_final/utils/matrix.dart';
import 'package:techarrow_mobile_final/utils/matrixTools.dart';

class DayPage extends StatefulWidget {
  const DayPage({super.key});

  @override
  State<DayPage> createState() => _DayPageState();
}

class _DayPageState extends State<DayPage> {

  Matrix matrix =  Matrix();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height / 2;
    return GestureDetector(
      onTapDown: (details) {
        // Здесь вы можете обработать нажатие
        print('Нажатие в точке ${details.localPosition}');
        print(matrix.numberOnXY(details.localPosition, width * 0.1, height * 0.2));
      },
      child: Column(
        children: [
          SizedBox(
            width: width,
            height: height * 0.2,
          ),
          Center(
            child: SizedBox(
              width: width * 0.8,
              height: height * 0.8,
              child: CustomPaint(
                key: ValueKey(matrix.matrix),
                painter: matrix
              ),
            )
          )
        ]
      )
    );
  }
}

