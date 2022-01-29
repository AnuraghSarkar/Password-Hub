import 'package:flutter/material.dart';
import 'package:foodlist/components/grocery_list.dart';
import 'package:foodlist/theme.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text('Foodie List'),
        backgroundColor: ThemeColors.primary,
        foregroundColor: Colors.black,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: const GroceryList(),
    );
  }
}
