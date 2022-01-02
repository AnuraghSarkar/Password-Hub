import 'package:flutter/material.dart';
import 'package:guessgame/widgets/customtextfield.dart';

class CreateRoomScreen extends StatefulWidget {
  const CreateRoomScreen({Key? key}) : super(key: key);

  @override
  _CreateRoomScreenState createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _roomNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Create Room',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              )),
          SizedBox(height: MediaQuery.of(context).size.height * 0.08),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextField(
              controller: _userNameController,
              hintText: 'Enter Your User Name',
            ),
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextField(
              controller: _roomNameController,
              hintText: 'Enter Your Room Name',
            ),
          ),
        ],
      ),
    );
  }
}
