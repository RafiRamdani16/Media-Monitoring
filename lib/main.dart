import 'package:flutter/material.dart';
import 'package:web_monitoring/view/Login.dart';
import 'package:web_monitoring/view/Search.dart';
import 'package:web_monitoring/view/Signup.dart';
import 'package:web_monitoring/view/adminPage.dart';
import 'package:web_monitoring/view/clientPage.dart';
import 'package:web_monitoring/view/landingPage.dart';
import 'package:web_monitoring/view/operatorPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    const Color backgroundColor = const Color(0x616161);
    return MaterialApp(
      theme: ThemeData(
        accentColor: backgroundColor,
      ),
      title: 'Media Monitoring',
      initialRoute: '/',
      routes: {
        '/': (context) => LandingPage(),
        '/adminPage': (context) => AdminPage(),
        '/clientPage': (context) => ClientPage(),
        '/loginPage': (context) => LoginPage(),
        '/operatorPage': (context) => OperatorPage(),
        '/signupPage': (context) => SignupActivity(),
        '/searchPage': (context) => SearchScreen()
      },
    );
  }
}
