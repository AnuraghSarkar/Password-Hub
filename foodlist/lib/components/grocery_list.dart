import 'package:flutter/material.dart';
import 'package:foodlist/models/grocery_item.dart';
import 'package:foodlist/services/grocery_item_service.dart';
import 'empty_list_indicator.dart';
import 'grocery_item_card.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({Key? key}) : super(key: key);

  @override
  _GroceryListState createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  bool _loading = false;
  List<GroceryItem> _items = [];

  @override
  void initState() {
    super.initState();

    _init();
  }

  Future<void> _init() async {
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() {
      _loading = true;
    });
    final items = await groceryItemService.list();
    setState(() {
      _items = items;
      _loading = false;
    });
  }

  Future<void> _refreshData() async {
    _loadData();
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
      return Center(
        child: EmptyListIndicator(
          title: 'Items Not Found',
          buttontext: 'Add Items',
          onButtonPressed: () {},
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _refreshData,
      child: ListView.builder(
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
