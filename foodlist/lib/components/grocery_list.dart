import 'package:flutter/material.dart';
import 'package:foodlist/models/grocery_item.dart';
import 'package:foodlist/services/grocery_item_service.dart';

import 'grocery_item_card.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({Key? key}) : super(key: key);

  @override
  _GroceryListState createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  bool _loading = true;
  List<GroceryItem> _items = [];

  @override
  void initState() {
    super.initState();

    _init();
  }

  Future<void> _init() async {
    final items = await groceryItemService.list();
    setState(() {
      _items = items;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.yellowAccent,
          color: Colors.tealAccent,
        ),
      );
    }

    if (_items.isEmpty) {
      return const Center(
        child: Text('No items found'),
      );
    }

    return ListView.builder(
      itemCount: _items.length,
      itemBuilder: (context, index) {
        final item = _items[index];
        return GroceryItemCard(
          groceryItem: item,
        );
      },
    );
  }
}
