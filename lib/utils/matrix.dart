import 'package:flutter/material.dart';
import 'package:techarrow_mobile_final/utils/matrixTools.dart';

class Matrix extends CustomPainter {
  List<List<Cell>> matrix = [];

  Size curSize = Size(0, 0);

  @override
  void paint(Canvas canvas, Size size) {

    matrix = createEmpty(10, 10);

    double kx = size.width / matrix[0].length;
    double ky = size.height / matrix.length;

    Paint paint = Paint();

    curSize = size;

    for (int y = 0; y < matrix.length; y++){
      for (int x = 0; x < matrix[0].length; x++){
        paint.color = matrix[y][x].darkColor;
        canvas.drawRect(
          Rect.fromPoints(
            Offset(x * kx, y * ky), Offset((x + 1) * kx, (y + 1) * ky)
          ),
          paint
        );
        paint.color = matrix[y][x].color;
        canvas.drawRect(
          Rect.fromPoints(
            Offset(x * kx + kx / 10, y * ky + ky / 10), Offset((x + 1) * kx - kx / 10, (y + 1) * ky - ky / 10)
          ),
          paint
        );
        paint.color = matrix[y][x].lightColor;
        canvas.drawRect(
          Rect.fromPoints(
            Offset(x * kx + kx / 10 * 3, y * ky + ky / 10 * 3), Offset((x + 1) * kx - kx / 10 * 6, (y + 1) * ky - ky / 10 * 6)
          ),
          paint
        );
      }
    }
  }

  void setMatrix(List<List<Cell>> newMatrix){
    matrix = newMatrix;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  Cell numberOnXY(Offset offset, double indentX, double indentY) {
    double kx = curSize.width / matrix[0].length;
    double ky = curSize.height / matrix.length;

    int cellX = ((offset.dx - indentX) / kx).floor();
    int cellY = ((offset.dy - indentY) / ky).floor();

    if (cellX < 0 || cellX >= matrix[0].length || cellY < 0 || cellY >= matrix.length) {
      return Cell(number: 10);
    }
    
    matrix[cellY][cellX].color = Colors.white;

    return matrix[cellY][cellX];
  }
}