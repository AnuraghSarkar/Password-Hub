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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'Authenticate For Foodie List',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.amber,
                fontSize: 60.0,
                height: 1.6,
                shadows: [
                  Shadow(
                    blurRadius: 12.0,
                    color: Colors.blue,
                    offset: Offset(6.0, 6.0),
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.fingerprint_outlined),
            iconSize: 100,
            onPressed: () async {
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
          )
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
