import 'package:flutter/material.dart';
import './create-room-screen.dart';
import './join_room_screen.dart';

class CreateJoinScreen extends StatefulWidget {
  const CreateJoinScreen({Key? key}) : super(key: key);

  @override
  _CreateJoinScreenState createState() => _CreateJoinScreenState();
}

class _CreateJoinScreenState extends State<CreateJoinScreen> {
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
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const CreateRoomScreen(),
                      ),
                    );
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
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const JoinRoomScreen(),
                      ),
                    );
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
