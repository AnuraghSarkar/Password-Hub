import 'package:flutter/material.dart';
import 'package:foodlist/screens/list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foodie List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const ListScreen(),
    );
  }
}
