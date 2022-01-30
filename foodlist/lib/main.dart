import 'package:flutter/material.dart';
import 'package:foodlist/providers/grocery_item_form_provider.dart';
import 'package:foodlist/screens/add_grocery_items_screen.dart';
import 'package:foodlist/screens/auth_screen.dart';
import 'package:foodlist/theme.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupSingletons();
  runApp(const MyApp());
}

void setupSingletons() {
  getIt.registerSingleton<GroceryItemFormProvider>(
      GroceryItemFormProviderImplementation(),
      signalsReady: true);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foodie List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: ThemeColors.primary),
      routes: {
        '/': (context) => const BiometericScreen(),
        AddGroceryItemScreen.routeName: (context) =>
            const AddGroceryItemScreen(),
      },
    );
  }
}
