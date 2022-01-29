import 'package:flutter/material.dart';
import 'package:foodlist/components/grocery_list.dart';
import 'package:foodlist/theme.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  void _handleAddItem() {}

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
        onPressed: _handleAddItem,
        child: const Icon(Icons.add),
        elevation: 11,
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: GroceryList(handleAddIem: _handleAddItem),
    );
  }
}
