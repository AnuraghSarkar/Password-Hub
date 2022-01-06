import 'package:flutter/material.dart';
import 'package:guessgame/home_screen.dart';
import 'package:guessgame/paint_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guess Game',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const PaintScreen(),
    );
  }
}
