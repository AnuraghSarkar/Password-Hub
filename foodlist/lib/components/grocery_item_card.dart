import 'package:flutter/material.dart';
import 'package:foodlist/components/grocery_item_checkbox.dart';
import 'package:foodlist/models/grocery_item.dart';
import 'package:foodlist/theme.dart';

class GroceryItemCard extends StatelessWidget {
  final GroceryItem groceryItem;

  const GroceryItemCard({Key? key, required this.groceryItem})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  groceryItem.name,
                  style: ThemeTextStyles.bodyText,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(groceryItem.categoryLabel, style: ThemeTextStyles.caption)
              ],
            ),
            GroceryItemCheckbox(
              groceryItem: groceryItem,
            ),
          ],
        ),
      ),
    );
  }
}
