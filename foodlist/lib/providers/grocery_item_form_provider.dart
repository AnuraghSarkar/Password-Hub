import 'package:flutter/material.dart';
import 'package:foodlist/models/grocery_item.dart';

abstract class GroceryItemFormProvider extends ChangeNotifier {
  GroceryItem _groceryItem;

  bool _isProcessing = false;
  GlobalKey<FormState> _form = GlobalKey<FormState>();

// getters
  GroceryItem get groceryItem;
  bool get isProcessing;
  GlobalKey<FormState> get form;

// operations
  void clearItem();
  Future<void> loadItem(GroceryItem item);
  Future<void> saveItem();

  // validation
  String validateName(String value);
}

class GroceryItemFormProviderImplementation extends GroceryItemFormProvider {
  GroceryItemFormProviderImplementation() {
    clearItem();
  }
}
