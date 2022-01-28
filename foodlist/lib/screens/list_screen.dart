import 'package:flutter/material.dart';
import 'package:foodlist/components/grocery_item_card.dart';
import 'package:foodlist/models/grocery_item.dart';
import 'package:foodlist/services/grocery_item_service.dart';
import 'package:foodlist/theme.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
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

      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          final item = _items[index];
          return GroceryItemCard(
            groceryItem: item,
          );
        },
      ),
    );
  }
}
