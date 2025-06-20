import 'package:flutter/material.dart';
import 'stream.dart';
import 'dart:async';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stream Eka',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: const StreamHomePage(),
    );
  }
}

class StreamHomePage extends StatefulWidget {
  const StreamHomePage({super.key});

  @override
  State<StreamHomePage> createState() => _StreamHomePageState();
}

class _StreamHomePageState extends State<StreamHomePage> {
  Color bgColor = Colors.blueGrey;
  late ColorStream colorStream;
  int lastNumber = 0;
  late StreamController numberStreamController;
  late NumberStream numberStream;

  // void changeColor() async {
  //   await for (var eventColor in colorStream.getColors()) {
  //     setState(() {
  //       bgColor = eventColor;
  //     });
  //   }
  //   ;
  // } // Soal 4

  // void changeColor() async {
  //   colorStream.getColors().listen((eventColor) {
  //     setState(() {
  //       bgColor = eventColor;
  //     });
  //   });
  // } // Soal 5

  // @override
  // void initState() {
  //   super.initState();
  //   colorStream = ColorStream();
  //   changeColor();
  // } // Soal 5

  // @override
  // void initState() {
  //   numberStream = NumberStream();
  //   numberStreamController = numberStream.controller;
  //   Stream stream = numberStreamController.stream;
  //   stream.listen((event) {
  //     setState(() {
  //       lastNumber = event;
  //     });
  //   });
  //   super.initState();
  // } // Soal 6

  @override
  void initState() {
    numberStream = NumberStream();
    numberStreamController = numberStream.controller;
    Stream stream = numberStreamController.stream;
    stream
        .listen((event) {
          setState(() {
            lastNumber = event;
          });
        })
        .onError((error) {
          setState(() {
            lastNumber = -1;
          });
        });
    super.initState();
  } // Soal 7

  @override
  void dispose() {
    numberStreamController.close();
    super.dispose();
  }

  void addRandomNumber() {
    Random random = Random();
    int myNum = random.nextInt(10);
    numberStream.addNumberToSink(myNum);
    // numberStream.addError(); // Soal 7;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stream Eka')),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(lastNumber.toString()),
            ElevatedButton(
              onPressed: () => addRandomNumber(),
              child: Text('New Random Number'),
            ),
          ],
        ),
      ),
    );
  }
}
