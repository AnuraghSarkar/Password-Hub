import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'register_screen.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      title: 'Account',
      builder: (context, widget) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, widget!),
          maxWidth: 1200,
          minWidth: 450,
          defaultScale: true,
          breakpoints: [
            ResponsiveBreakpoint.resize(450, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            ResponsiveBreakpoint.autoScale(2460, name: '4K'),
          ],
          background: Container(color: Color(0xFFF5F5F5))),
      home: AccountHome(title: 'Rental'),
      theme: ThemeData(
        pageTransitionsTheme: PageTransitionsTheme(builders: const {
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
        }),
      ),
    );
  }
}

class AccountHome extends StatefulWidget {
  const AccountHome({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffffffff),
        body: Container(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                      alignment: FractionalOffset.topCenter,
                      child: Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height / 14),
                        child: Column(
                          children: [
                            ShaderMask(
                              
                              shaderCallback: (rect) {
                                return LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: const [
                                    Colors.black,
                                    Colors.blueAccent
                                  ],
                                ).createShader(Rect.fromLTRB(0, 0, 900, 900));
                              },
                              blendMode: BlendMode.dstIn,
                              child: Container(
                                height: 200,
                                width: 600,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fskribbl.io%2Fres%2Flogo.gif&f=1&nofb=1'),
                                    fit: BoxFit.fitWidth,
                                  ), //DecorationImage
                                ), //BoxDecoration
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              padding: EdgeInsets.all(20),
                              child: Text(
                                'Be a part of the community',
                                style: TextStyle(
                                    color: Color(0xff161830),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 25),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 30.0),
                        child: ButtonTheme(
                          minWidth: 300.0,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                            },
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30))),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.orange),
                                overlayColor:
                                    MaterialStateProperty.all(Colors.red),
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.all(20)),
                                textStyle: MaterialStateProperty.all<TextStyle>(
                                    TextStyle(color: Colors.white)),
                                minimumSize: MaterialStateProperty.all<Size>(Size(
                                    MediaQuery.of(context).size.width / 1.7,
                                    MediaQuery.of(context).size.height * .06))),
                            child: const Text(
                              'Log In',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                          ),
                        ), //Your widget here,
                      ),
                    ),
                    Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 200.0),
                        child: ButtonTheme(
                          minWidth: 400.0,
                          height: 60,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.0)),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RegisterScreen()));
                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30))),
                                  backgroundColor: MaterialStateProperty.all<Color>(
                                      Colors.orange),
                                  overlayColor:
                                      MaterialStateProperty.all(Colors.red),
                                  padding: MaterialStateProperty.all(
                                      const EdgeInsets.all(20)),
                                  textStyle: MaterialStateProperty.all<TextStyle>(
                                      TextStyle(color: Colors.white)),
                                  minimumSize: MaterialStateProperty.all<Size>(Size(
                                      MediaQuery.of(context).size.width / 1.7,
                                      MediaQuery.of(context).size.height * .06))),
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ), //Your widget here,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
