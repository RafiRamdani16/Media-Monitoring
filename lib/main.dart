import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_monitoring/controller/authentication.dart';
import 'package:web_monitoring/controller/searchController.dart';
import 'package:web_monitoring/view/Login.dart';
import 'package:web_monitoring/view/Search.dart';
import 'package:web_monitoring/view/adminPage.dart';
import 'package:web_monitoring/view/clientPage.dart';
import 'package:web_monitoring/view/landingPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Media Monitoring',
      initialRoute: '/',
      routes: {
        '/': (context) => LandingPage(),
        '/adminPage': (context) => AdminPage(),
        '/clientPage': (context) => ClientPage()
      },
    );
  }
}
