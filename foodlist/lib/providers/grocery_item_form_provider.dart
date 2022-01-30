import 'package:flutter/material.dart';
import 'package:foodlist/models/grocery_item.dart';

abstract class GroceryItemFormProvider extends ChangeNotifier {
  GroceryItem _groceryItem = GroceryItem();

  bool _isProcessing = false;
  final GlobalKey<FormState> _form = GlobalKey<FormState>();

// getters
  GroceryItem get groceryItem;
  bool get isProcessing;
  GlobalKey<FormState> get form;

// operations
  void clearItem();
  void setItem(GroceryItem item);
  void loadItem(GroceryItem item);
  Future<GroceryItem?> saveItem();

  // validation
  String? validateName(String? value);

  void setName(String name);
}

class GroceryItemFormProviderImplementation extends GroceryItemFormProvider {
  GroceryItemFormProviderImplementation() {
    clearItem();
  }

  void handleUpdate() {
    notifyListeners();
  }

  @override
  void clearItem() {
    _groceryItem = GroceryItem();
    handleUpdate();
  }

  @override
  void setItem(GroceryItem item) {
    _groceryItem = item;
    handleUpdate();
  }

  @override
  GlobalKey<FormState> get form => _form;

  @override
  GroceryItem get groceryItem => _groceryItem;

  @override
  bool get isProcessing => _isProcessing;

  @override
  void loadItem(GroceryItem item) async {
    _groceryItem = item;
    handleUpdate();
  }

  @override
  Future<GroceryItem?> saveItem() async {
    if (!_form.currentState!.validate()) {
      handleUpdate();
      return null;
    }

    _isProcessing = true;
    handleUpdate();

    await Future.delayed(const Duration(milliseconds: 500));

    final newGroceryItem = GroceryItem.fromJson({
      'id': 99,
      'name': _groceryItem.name,
      'category': 'miscellaneous',
      'purchased': false
    });
    _isProcessing = false;

    handleUpdate();
    return newGroceryItem;
  }

  @override
  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return "Item Name is required";
    }
    return null;
  }

  @override
  void setName(String name) {
    _groceryItem.name = name;
    handleUpdate();
  }
}
