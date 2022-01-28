import 'package:foodlist/screens/list_screen.dart';
import 'package:foodlist/services/service_auth.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class BiometericScreen extends StatelessWidget {
  const BiometericScreen({Key? key}) : super(key: key);

  static const colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  static const colorizeTextStyle = TextStyle(
    fontSize: 50.0,
    fontFamily: 'Horizon',
  );

  @override
  Widget build(BuildContext context) {
    // return SafeArea(
    //     child: Scaffold(
    //   body: Center(
    //       child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: [
    //       IconButton(
    //         icon: const Icon(Icons.fingerprint_outlined),
    //         iconSize: 100,
    //         onPressed: () async {
    //           final isAuthenticate = await LocalAuthApi.authenticate();
    //           if (isAuthenticate == true) {
    //             Navigator.pushReplacement(
    //                 context,
    //                 MaterialPageRoute(
    //                   builder: (context) => const ListScreen(),
    //                 ));
    //           } else {
    //             return;
    //           }
    //         },
    //       )
    //     ],
    //   )),
    // ));
    return SizedBox(
      width: 250.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedTextKit(
            animatedTexts: [
              ColorizeAnimatedText(
                'Larry Page',
                textStyle: colorizeTextStyle,
                colors: colorizeColors,
              ),
              ColorizeAnimatedText(
                'Bill Gates',
                textStyle: colorizeTextStyle,
                colors: colorizeColors,
              ),
              ColorizeAnimatedText(
                'Steve Jobs',
                textStyle: colorizeTextStyle,
                colors: colorizeColors,
              ),
            ],
            isRepeatingAnimation: true,
            onTap: () {
              print("Tap Event");
            },
          ),
        ],
      ),
    );
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
