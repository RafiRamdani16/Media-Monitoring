import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_monitoring/view/Login.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    isNotLoggedIn().then((it) {
      if (it) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginActivity()));
      }
      return;
    });
    // presenter = MainActivityPresenter(this);
    super.initState();
  }

  Future<bool> isNotLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString('api_token') ?? "undefined");
    return (token == "undefined");
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
