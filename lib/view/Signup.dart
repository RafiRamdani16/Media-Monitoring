import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:web_monitoring/controller/SignupController.dart';
import 'package:web_monitoring/controller/authentication.dart';

import 'package:web_monitoring/model/signupModel.dart';
import 'package:web_monitoring/view/Login.dart';

class SignupActivity extends StatefulWidget {
  @override
  _SignupActivityState createState() => _SignupActivityState();
}

class _SignupActivityState extends State<SignupActivity>
    implements SignupViewModel {
  late SignupController presenter;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late Authentication authentication = new Authentication();
  late String deviceID;

  @override
  void initState() {
    super.initState();
    presenter = SignupController(this);
  }

  void _doSignup(String name, String email, String password, String deviceID) {
    if (name.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
      if (name.length > 5) {
        if (password.length > 8) {
          presenter.signup(name, email, password, deviceID);
        } else {
          toast("Password at least eight letter");
        }
      } else {
        toast("Name at least five letter");
      }
    } else {
      toast("Please fill all forms");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sign Up'),
        ),
        body: Padding(
            padding: EdgeInsets.all(16),
            child: Center(
              child: Container(
                  alignment: Alignment.center,
                  // color: Colors.red,
                  width: 480,
                  height: 480,
                  padding: EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.zero,
                        child: Text(
                          'Name',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            hintText: 'Enter your Name'),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(top: 12),
                        child: Text(
                          'email',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            hintText: 'Enter your email'),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(top: 12),
                        child: Text(
                          'Password',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      TextFormField(
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            hintText: 'Enter your password'),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(top: 12),
                        child: Text(
                          'Retype your password',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            hintText: 'Enter your password'),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 30),
                        child: TextButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blue)),
                          onPressed: () async {
                            deviceID = await authentication.formatDeviceID();
                            _doSignup(
                                nameController.text.trim(),
                                emailController.text.trim(),
                                passwordController.text.trim(),
                                deviceID);
                          },
                          child: Text(
                            "Signup",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  )),
            )));
  }

  @override
  void finish() => Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => LoginPage()), (r) => false);

  @override
  void toast(String message) => Fluttertoast.showToast(msg: message);
}
