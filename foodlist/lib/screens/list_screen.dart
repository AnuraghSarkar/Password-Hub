import 'package:flutter/material.dart';
import 'package:foodlist/mocks/grocery_items_mock.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    const items = groceryItems;
    return Scaffold(
      appBar: AppBar(title: const Text('Foodie List')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            child: Text(item['name']),
          );
        },
      ),
    );
  }
}
