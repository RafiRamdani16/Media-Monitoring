import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:web_monitoring/controller/authentication.dart';
import 'package:web_monitoring/controller/loginController.dart';
import 'package:web_monitoring/model/loginModel.dart';
import 'package:web_monitoring/model/usersModel.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> implements LoginViewModel {
  late LoginController presenter;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late Authentication authentication = new Authentication();
  late String deviceID;
  UserModel user = new UserModel();

  @override
  void initState() {
    super.initState();
    presenter = LoginController(this);
  }

  void doLogin(String email, String password, String deviceID) {
    if (password.length < 8) {
      toast("Password berisi setidaknya 8 karakter");
      return;
    }
    presenter.login(email, password, deviceID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.all(16),
            child: Center(
              child: Container(
                alignment: Alignment.center,
                // color: Colors.red,
                width: 480,
                height: 360,
                padding: EdgeInsets.all(30),

                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.zero,
                        child: Text(
                          'Email',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      TextField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            hintText: 'Enter your Email'),
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
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            hintText: 'Enter your password'),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(top: 15),
                        child: TextButton(
                          onPressed: () {},
                          child: Text("Forgot Password"),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 30),
                        child: TextButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blue)),
                          onPressed: () async {
                            deviceID = await authentication.formatDeviceID();
                            doLogin(emailController.text.trim(),
                                passwordController.text.trim(), deviceID);
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 15),
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed('/signupPage');
                          },
                          child: Text("Don't have an account yet?"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }

  @override
  void finish() {
    if (user.role == 'admin') {
      Navigator.of(context).pushReplacementNamed('/adminPage');
    } else if (user.role == 'operator') {
      Navigator.of(context).pushReplacementNamed('/operatorPage');
    } else {
      Navigator.of(context).pushReplacementNamed('/clientPage');
    }
  }

  @override
  void toast(String message) => Toast.values;
}
