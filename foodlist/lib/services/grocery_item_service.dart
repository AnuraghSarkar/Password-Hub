import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodlist/mocks/grocery_items_mock.dart';
import 'package:foodlist/models/grocery_item.dart';

class GroceryItemService {
  Future<List<GroceryItem>> list() async {
    const data = groceryItems;
    await Future.delayed(const Duration(milliseconds: 300));

    final List<GroceryItem> results =
        data.map<GroceryItem>((json) => GroceryItem.fromJson(json)).toList();
    return results;
  }
}

GroceryItemService _export() {
  final service = Provider((ref) => GroceryItemService());
  final container = ProviderContainer();
  return container.read(service);
}
