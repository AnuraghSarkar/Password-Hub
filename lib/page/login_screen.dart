import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

void main() {
  runApp(LoginScreen());
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoginHome(
      title: 'Login',
    );
  }
}

class LoginHome extends StatefulWidget {
  const LoginHome({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xffffffff),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            widget.title,
            style: TextStyle(color: Color(0xff001035)),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 0, left: 20, right: 20),
              child: Column(
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.network('https://skribbl.io/res/logo.gif'),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Email',
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Password',
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock_outline),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
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
                      'Login',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text('OR'),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 60,
                    child: ButtonTheme(
                      minWidth: 400.0,
                      height: 100,
                      child: SignInButton(
                        Buttons.Facebook,
                        shape: RoundedRectangleBorder(),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  Container(
                    height: 90,
                    padding: EdgeInsets.only(top: 40),
                    child: ButtonTheme(
                      minWidth: 400.0,
                      height: 100,
                      child: SignInButton(
                        Buttons.Google,
                        shape: RoundedRectangleBorder(),
                        onPressed: () {},
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
