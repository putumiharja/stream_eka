import 'package:flutter/material.dart';
import 'dart:async';

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
} //Soal 2 & 3

class NumberStream {
  final StreamController<int> controller = StreamController<int>();

  void addNumberToSink(int newNumber) {
    controller.sink.add(newNumber);
  }

  close() {
    controller.close();
  }
}
