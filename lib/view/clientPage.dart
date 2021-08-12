import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_monitoring/view/Login.dart';

void _logout() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();
}

class ClientPage extends StatefulWidget {
  @override
  _ClientPageState createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Media Monitoring"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                        content: Text("Are you sure want to logout?"),
                        actions: <Widget>[
                          TextButton(
                            child: Text("SIGN OUT"),
                            onPressed: () {
                              _logout();
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginActivity()),
                                  (r) => false);
                            },
                          ),
                        ]);
                  });
            },
          )
        ],
      ),
      body: Center(
        child: Text("Client Page"),
      ),
    );
  }
}
