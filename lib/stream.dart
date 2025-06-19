import 'package:flutter/material.dart';

class ColorStream {
  final List<Color> colors = [
    Colors.deepPurple,
    Colors.deepPurpleAccent,
    Colors.pinkAccent,
    Colors.orange,
    Colors.teal,
  ]; //Soal 2

  Stream<Color> getColors() async* {
    yield* Stream.periodic(const Duration(seconds: 1), (int t) {
      int index = t % colors.length;
      return colors[index];
    }); //Soal 3
  }
}
