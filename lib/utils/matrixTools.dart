import 'package:flutter/material.dart';


class Cell{
  int number = 0;
  Color color = Color.fromARGB(255, 229, 228, 228);
  Color darkColor = Color.fromARGB(255, 196, 187, 187);
  Color lightColor = Colors.white;

  Cell({int number=0, Color color = const Color.fromARGB(255, 229, 228, 228)}){
    this.number = number;
    this.color = color;
    darkColor = darken(color);
    lightColor = lighten(color);
  }

  Cell copy(){
    return Cell(number: number, color: color);
  }

  Color darken(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  Color lighten(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslLight = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }

  String toString(){
    return "$number";
  }
}

List<List<Cell>> createEmpty(int rows, int columns){
  return List.generate(rows, (_) => List.generate(columns, (_) => Cell()));
}

bool moveDownShape(List<List<Cell>> matrix, int number){
  for (int y = matrix.length - 1; y > 0; y--) {
    for (int x = 0; x < matrix[y].length; x++) {
      if(matrix[y][x].number != 0 && matrix[y - 1][x].number == number){
        return false;
      }
    }
  }

  for (int y = matrix.length - 1; y >= 0; y--) {
    for (int x = 0; x < matrix[0].length; x++) {
      if (matrix[y][x].number == number){
        matrix[y + 1][x] = matrix[y][x].copy();
        matrix[y][x] = Cell();
      }
    }
  }

  return true;
}