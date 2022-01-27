import 'package:flutter/material.dart';
import 'package:foodlist/models/grocery_item.dart';

class GroceryItemCheckbox extends StatefulWidget {
  final GroceryItem groceryItem;

  const GroceryItemCheckbox({Key? key, required this.groceryItem})
      : super(key: key);

  @override
  State<GroceryItemCheckbox> createState() => _GroceryItemCheckboxState();
}

class _GroceryItemCheckboxState extends State<GroceryItemCheckbox> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          widget.groceryItem.purchased = !widget.groceryItem.purchased;
          setState(() {});
        },
        icon: widget.groceryItem.purchased
            ? const Icon(Icons.check_circle_rounded, color: Colors.greenAccent)
            : const Icon(Icons.check_circle_outline_outlined));
  }
}
