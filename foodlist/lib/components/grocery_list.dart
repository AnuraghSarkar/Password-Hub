import 'package:flutter/cupertino.dart';
import 'package:foodlist/models/grocery_item.dart';
import 'package:foodlist/services/grocery_item_service.dart';

import 'grocery_item_card.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({Key? key}) : super(key: key);

  @override
  _GroceryListState createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
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
    });
  }

  @override
  Widget build(BuildContext context) {
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
