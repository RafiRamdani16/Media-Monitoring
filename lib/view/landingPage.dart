import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_monitoring/view/Login.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  // @override
  // void initState() {
  //   isNotLoggedIn().then((it) {
  //     if (it) {
  //       Navigator.pushReplacement(
  //           context, MaterialPageRoute(builder: (context) => LoginPage()));
  //     }
  //     return;
  //   });
  //   super.initState();
  // }

  // Future<bool> isNotLoggedIn() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String token = (prefs.getString('api_token') ?? "undefined");
  //   return (token == "undefined");
  // }

  @override
  Widget build(BuildContext context) {
    TextEditingController keyword = TextEditingController();
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/loginPage');
              },
              child: Text('Login'),
            ),
            MaterialButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/signupPage');
                },
                child: Text('SignUp')),
            TextField(
              controller: keyword,
              decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: 'Please Input the Keyword'),
            ),
            MaterialButton(
                child: Text('Search'),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/dashboardPage');
                }),
          ],
        ),
      ),
    );
  }
}
