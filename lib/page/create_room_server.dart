import 'package:flutter/material.dart';
import 'package:guessgame/page/paint_screen.dart';
import 'package:guessgame/widgets/customtextfield.dart';

class CreateRoomScreen extends StatefulWidget {
  const CreateRoomScreen({Key? key}) : super(key: key);

  @override
  _CreateRoomScreenState createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _roomNameController = TextEditingController();
  late String? _maxRoundsValue;
  late String? _maxRoomSizeValue;
  void createRoom() {
    if (_userNameController.text.isNotEmpty &&
        _roomNameController.text.isNotEmpty &&
        _maxRoundsValue != null &&
        _maxRoomSizeValue != null) {
      Map data= {'nickname':_userNameController.text, 'name':_roomNameController.text, 'maxrounds':_maxRoundsValue, 'maxroomsize':_maxRoomSizeValue};
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaintScreen(data: data, screenFrom: 'createRoom')));
    }
  }
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
          SizedBox(height: 20),
          DropdownButton(
            focusColor: Color(0xffdcdce8),
            items: ['2', '5', '10', '15']
                .map((e) => DropdownMenuItem(
                    child: Text(
                      e,
                      style: TextStyle(color: Colors.black),
                    ),
                    value: e))
                .toList(),
            hint: Text(
              'Select Number of Rounds',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            onChanged: (String? e) {
              setState(() {
                _maxRoundsValue = e;
              });
            },
          ),
          SizedBox(height: 20),
          DropdownButton(
            focusColor: Color(0xffdcdce8),
            items: ['2', '3', '4', '5', '6', '7', '8']
                .map((e) => DropdownMenuItem(
                    child: Text(
                      e,
                      style: TextStyle(color: Colors.black),
                    ),
                    value: e))
                .toList(),
            hint: Text(
              'Select Room Size',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            onChanged: (String? e) {
              setState(() {
                _maxRoomSizeValue = e;
              });
            },
          ),
          SizedBox(height: 40),
          ElevatedButton(
            onPressed: createRoom,
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
        ],
      ),
    );
  }
}
