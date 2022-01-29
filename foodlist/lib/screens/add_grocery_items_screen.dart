import 'package:flutter/material.dart';

class AddGroceryItemScreen extends StatelessWidget {
  static const routeName = '/add-grocery_item';

  const AddGroceryItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Items')),
    );
  }
}
