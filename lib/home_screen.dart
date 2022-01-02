import 'package:flutter/material.dart';
import 'package:guessgame/create-room-screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Create or Join a Room',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const CreateRoomScreen(),),);
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.orange),
                      textStyle: MaterialStateProperty.all<TextStyle>(
                          TextStyle(color: Colors.white)),
                      minimumSize: MaterialStateProperty.all<Size>(Size(
                          MediaQuery.of(context).size.width / 2.5,
                          MediaQuery.of(context).size.height * .06))),
                  child: const Text(
                    'Create Room',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.orange),
                      textStyle: MaterialStateProperty.all<TextStyle>(
                          TextStyle(color: Colors.white)),
                      minimumSize: MaterialStateProperty.all<Size>(Size(
                          MediaQuery.of(context).size.width / 2.5,
                          MediaQuery.of(context).size.height * .06))),
                  child: const Text(
                    'Join Room',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                )
              ],
            )
          ]),
    );
  }
}
