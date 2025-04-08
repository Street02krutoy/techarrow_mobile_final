import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:techarrow_mobile_final/utils/matrix.dart';

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
        print(matrix.numberOnXY(details.localPosition, height * 0.2));
      },
      child: Column(
        children: [
          SizedBox(
            width: width,
            height: height * 0.2,
          ),
          SizedBox(
            width: width,
            height: height * 0.8,
            child: CustomPaint(
              painter: matrix
            ),
          )
        ]
      )
    );
  }
}

