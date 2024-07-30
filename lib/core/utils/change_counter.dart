import 'package:flutter/material.dart';
import 'dart:async';

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  CounterAppState createState() => CounterAppState();
}

class CounterAppState extends State<CounterApp> {
  int counter = 1233582;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 10), (Timer t) {
      setState(() {
        counter++;
        if (counter > 1233595) {
          counter = 1233582;
        }
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Counter App'),
        ),
        body: Center(
          child: Text(
            '$counter',
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
