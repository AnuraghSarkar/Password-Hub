import 'package:flutter/material.dart';
import 'package:foodlist/screens/add_grocery_items_screen.dart';
import 'package:foodlist/screens/auth_screen.dart';
import 'package:foodlist/theme.dart';

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
      theme: ThemeData(primarySwatch: ThemeColors.primary),
      routes: {
        '/': (context) => const BiometericScreen(),
        AddGroceryItemScreen.routeName: (context) =>
            const AddGroceryItemScreen(),
      },
    );
  }
}
