
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'auth.dart';
import 'package:flutter_just_toast/flutter_just_toast.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
    final emailController = TextEditingController();
  final passController = TextEditingController();
  bool _validate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("My Profile"),
      ),
      body:Form(
                child: Container(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(40),
                        ],
                        decoration: InputDecoration(
                          labelText: "Enter Email",
                          errorText: _validate ? 'Email Can\'t Be Empty' : null,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: true,
                        controller: emailController,
                      ),
                      TextFormField(
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(40),
                        ],
                        decoration: InputDecoration(
                          labelText: "Enter Password",
                          errorText:
                              _validate ? 'Password Can\'t Be Empty' : null,
                        ),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        controller: passController,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          ButtonTheme(
                              minWidth: 100.0,
                              height: 50.0,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                color: Colors.green,
                                textColor: Colors.white,
                                child: Text("Login"),
                                onPressed: () async {
                                  if (!(emailController.text.isEmpty ||
                                      passController.text.isEmpty)) {
                                    setState(() {
                                      _validate = false;
                                    });
                                  } else {
                                    setState(() {
                                      _validate = true;
                                    });
                                  }
                                  if (!_validate == true) {
                                
                                  }
                                },
                              )),
                          ButtonTheme(
                              minWidth: 100.0,
                              height: 50.0,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                color: Colors.blue,
                                textColor: Colors.white,
                                child: Text("Sign Up"),
                                onPressed: () {
                                  if (!(emailController.text.isEmpty ||
                                      passController.text.isEmpty)) {
                                    setState(() {
                                      _validate = false;
                                    });
                                  } else {
                                    setState(() {
                                      _validate = true;
                                    });
                                  }
                                },
                              )),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30.0),
                      ),
                      new InkWell(
                        child: new Text(
                          "Forgot your password?",
                          style: TextStyle(color: Colors.blue, fontSize: 16),
                        ),
                        onTap: () async {
                          if (emailController.text.isEmpty == false) {
                            bool emailValid = RegExp(
                                    r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(emailController.text);
                            if (emailValid == true) {
                   
                            } else {
                              Toast.show(
                                  message: "Invalid email ID",
                                  duration: Delay.LONG,
                                  textColor: Colors.black);
                            }
                          } else {
                            Toast.show(
                                message: "Kindly enter an email address",
                                duration: Delay.LONG,
                                textColor: Colors.black);
                          }
                          ;
                        },
                      )
                    ],
                  ),
                ),
              )
      
    );
  }
}