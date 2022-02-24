import 'dart:async';
import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:client/controller/network_controller.dart';
import 'package:client/controller/password_controller/password_controller.dart';
import 'package:client/widgets/categories/category_list.dart';
import 'package:client/widgets/header.dart';
import 'package:client/widgets/password_widgets/password_list.dart';
import 'package:client/widgets/password_widgets/password_shimmer.dart';
import 'package:client/widgets/search_widgets/search.dart';
import 'package:client/widgets/search_widgets/search_bar.dart';
import 'package:client/widgets/user_widgets/unauthorized_widget.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:client/main.dart';

import 'error_screens/no_connection.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<double>? _accelerometerValues;

  final _streamSubscriptions = <StreamSubscription<dynamic>>[];

  @override
  void dispose() {
    super.dispose();
    for (final subscription in _streamSubscriptions) {
      subscription.cancel();
    }
  }

  @override
  void initState() {
    super.initState();
    _streamSubscriptions.add(
      accelerometerEvents.listen(
        (AccelerometerEvent event) {
          if (event.y > 10 && event.y < 15) {
            // logout user
            box.remove("auth-token");
            box.remove("id");
            box.remove("email");
            Get.offAllNamed("/master-pass");
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final accelerometer =
        _accelerometerValues?.map((double v) => v.toStringAsFixed(1)).toList();
    final passwordController = Get.put(PasswordController());
    var networkController = Get.put(NetworkConnectivityController());

    return Obx(
      () => DoubleBack(
        message: "Press back again to close",
        child: (passwordController.isLogedIn.value)
            ? (networkController.connectionStatus.value != 0)
                ? (passwordController.isLoading.value)
                    ? PasswordShimmer()
                    : Scaffold(
                        floatingActionButton: FloatingActionButton(
                          onPressed: () {
                            Get.toNamed('/password/new');
                          },
                          child: Icon(CupertinoIcons.add),
                          backgroundColor: Colors.redAccent,
                        ),
                        body: SafeArea(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 10.0),
                            child: RefreshIndicator(
                              onRefresh: () {
                                return reLoadPage(passwordController);
                              },
                              child: ListView(
                                children: [
                                  Header(),
                                  SizedBox(
                                    height: 30.0,
                                  ),
                                  InkWell(
                                    borderRadius: BorderRadius.circular(10.0),
                                    onTap: () {
                                      showSearch(
                                        context: context,
                                        delegate: SearchBar(),
                                      );
                                    },
                                    child: Search(
                                        width:
                                            MediaQuery.of(context).size.width),
                                  ),
                                  SizedBox(
                                    height: 30.0,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Categories :",
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Get.toNamed('/search');
                                        },
                                        child: Text("View All"),
                                      ),
                                    ],
                                  ),
                                  CategoryList(),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "All Passwords :",
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Get.toNamed('/password/all');
                                        },
                                        child: Text("View All"),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 30.0,
                                  ),
                                  PasswordList(
                                    count: 5,
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                : Scaffold(
                    body: SafeArea(
                      child: NoConnection(
                        controller: "passwordController",
                        fromRoute: "/home",
                      ),
                    ),
                  )
            : Unauthorized(),
      ),
    );
  }
}

reLoadPage(controller) {
  return controller.fetchPassword();
}
