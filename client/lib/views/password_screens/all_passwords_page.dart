import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:client/controller/password_controller/password_controller.dart';
import 'package:client/widgets/password_widgets/password_list.dart';
import 'package:client/widgets/user_widgets/unauthorized_widget.dart';

class AllPasswords extends StatelessWidget {
  const AllPasswords({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final passwordController = Get.put(PasswordController());

    return Obx(
      () => (passwordController.isLogedIn.value)
          ? Scaffold(
              appBar: AppBar(
                title: Text("All Passwords"),
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: PasswordList(
                  count: passwordController
                      .passwordData["Passwords"]!.results.length,
                ),
              ),
            )
          : Unauthorized(),
    );
  }
}
