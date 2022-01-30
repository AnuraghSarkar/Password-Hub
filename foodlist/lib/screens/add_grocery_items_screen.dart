import 'package:flutter/material.dart';
import 'package:foodlist/main.dart';
import 'package:foodlist/providers/grocery_item_form_provider.dart';

class AddGroceryItemScreen extends StatefulWidget {
  static const routeName = '/add-grocery_item';

  const AddGroceryItemScreen({Key? key}) : super(key: key);

  @override
  State<AddGroceryItemScreen> createState() => _AddGroceryItemScreenState();
}

class _AddGroceryItemScreenState extends State<AddGroceryItemScreen> {
  final formProvider = getIt<GroceryItemFormProvider>();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text('Add Items'),
        backgroundColor: Colors.tealAccent,
        foregroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Form(
        key: formProvider.form,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            TextFormField(
              decoration: const InputDecoration(labelText: "Item Name"),
              autofocus: true,
              onChanged: (value) {
                formProvider.setName(value);
              },
              validator: formProvider.validateName,
            ),
          ]),
        ),
      ),
    );
  }
}
