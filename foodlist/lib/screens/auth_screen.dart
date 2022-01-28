import 'package:foodlist/screens/list_screen.dart';
import 'package:foodlist/services/service_auth.dart';
import 'package:flutter/material.dart';

class BiometericScreen extends StatelessWidget {
  const BiometericScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
          child: Column(
        children: [
          TextButton(
            onPressed: () async {
              print('i');
              final isAuthenticate = await LocalAuthApi.authenticate();
              if (isAuthenticate == true) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ListScreen(),
                    ));
              } else {
                return;
              }
            },
            child: const Text("AUTH"),
          ),
        ],
      )),
    ));
  }

  Widget buildT(String text, bool checked) {
    return Row(
      children: [
        checked ? const Icon(Icons.check) : const Icon(Icons.close),
        const Text("Biometrics"),
      ],
    );
  }
}
