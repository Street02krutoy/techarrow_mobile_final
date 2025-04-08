import 'package:flutter/material.dart';

Map<int, Color> colors = {
  0: const Color.fromARGB(255, 229, 228, 228),
  1: Colors.red,
  2: Colors.blue,
  3: Colors.green,
};

Map<int, Color> addColors2 = {
  0: const Color.fromARGB(255, 255, 255, 255),
  1: const Color.fromARGB(255, 255, 96, 84),
  2: const Color.fromARGB(255, 67, 165, 246),
  3: const Color.fromARGB(255, 118, 223, 121),
};

Map<int, Color> addColors1 = {
  0: Color.fromARGB(255, 200, 200, 200),
  1: const Color.fromARGB(255, 139, 45, 39),
  2: const Color.fromARGB(255, 21, 97, 159),
  3: const Color.fromARGB(255, 50, 114, 52),
};




class Matrix extends CustomPainter {
  List<List<int>> matrix = [];

  Size curSize = Size(0, 0);

  List<List<int>> test = [ // потом поменять
    [0, 1, 2, 3, 3, 3, 2, 1],
    [3, 2, 1, 0, 1, 1, 2, 0],
    [1, 0, 3, 2, 3, 2, 1, 0],
    [2, 3, 0, 1, 0, 2, 0, 3],
    [1, 0, 3, 2, 3, 2, 1, 0],
    [1, 2, 3, 3, 0, 2, 1, 0],
    [1, 3, 3, 2, 2, 1, 1, 0],
    [1, 2, 0, 2, 3, 1, 1, 0],
    [1, 0, 3, 1, 3, 0, 3, 1],
  ];

  @override
  void paint(Canvas canvas, Size size) {
    matrix = test; // здесь тоже 

    double kx = size.width / matrix[0].length;
    double ky = size.height / matrix.length;

    Paint paint = Paint();

    curSize = size;

    for (int y = 0; y < matrix.length; y++){
      for (int x = 0; x < matrix[0].length; x++){
        paint.color = addColors1[matrix[y][x]] ?? Colors.white;
        canvas.drawRect(
          Rect.fromPoints(
            Offset(x * kx, y * ky), Offset((x + 1) * kx, (y + 1) * ky)
          ),
          paint
        );
        paint.color = colors[matrix[y][x]] ?? Colors.white;
        canvas.drawRect(
          Rect.fromPoints(
            Offset(x * kx + kx / 10, y * ky + ky / 10), Offset((x + 1) * kx - kx / 10, (y + 1) * ky - ky / 10)
          ),
          paint
        );
        paint.color = addColors2[matrix[y][x]] ?? Colors.white;
        canvas.drawRect(
          Rect.fromPoints(
            Offset(x * kx + kx / 10 * 3, y * ky + ky / 10 * 3), Offset((x + 1) * kx - kx / 10 * 6, (y + 1) * ky - ky / 10 * 6)
          ),
          paint
        );
      }
    }
  }

  void setMatrix(List<List<int>> newMatrix){
    matrix = newMatrix;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  int numberOnXY(Offset offset, double indentY) {
    double kx = curSize.width / matrix[0].length;
    double ky = curSize.height / matrix.length;

    int cellX = ((offset.dx) / kx).floor();
    int cellY = ((offset.dy - indentY) / ky).floor();

    if (cellX < 0 || cellX >= matrix[0].length || cellY < 0 || cellY >= matrix.length) {
      return -1;
    }

    return matrix[cellY][cellX];
  }
}