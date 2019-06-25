import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'auth.dart';
import 'package:flutter_just_toast/flutter_just_toast.dart';

class Login extends StatefulWidget {
  Login({Key key, this.title, this.auth, this.onSignIn}) : super(key: key);

  final String title;
  final BaseAuth auth;
  final VoidCallback onSignIn;

  @override
  _LoginState createState() => _LoginState();
}

enum FormMode { LOGIN, SIGNUP }

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool _validate = false;

@override
void dispose() {
  _iconAnimationController.dispose();
  super.dispose();
}

  void _login() async {}

  void _signUp() async {
    print("inside signup");
    var _email = emailController.text;
    var _pass = passController.text;
    try {
      String userId = await widget.auth.createUser(_email, _pass);
      print(userId);
      Toast.show(
          message: "Signed up succesfully! Try logging in now.",
          duration: Delay.LONG,
          textColor: Colors.black);
    } catch (e) {
      var error = e.message;
      Toast.show(
          message: "Error : $error",
          duration: Delay.LONG,
          textColor: Colors.black);
    }
  }

  void signUpFirebase() {
    print("bye");
  }

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 500));

    _iconAnimation = CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.easeOut);

    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       resizeToAvoidBottomPadding: false,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlutterLogo(
                size: _iconAnimation.value * 100,
              ),
              Form(
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
                                    print("inside login");
                                    var _email = emailController.text;
                                    var _pass = passController.text;
                                    try {
                                      String userId = await widget.auth
                                          .signIn(_email, _pass);
                                      print(userId);
                                      Navigator.pushNamed(context, '/home');
                                    } catch (e) {
                                      var error = e.message;
                                      Toast.show(
                                          message: "Error : $error",
                                          duration: Delay.LONG,
                                          textColor: Colors.black);
                                    }
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
                                  !_validate ? _signUp() : null;
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
                              await widget.auth
                                  .sendPasswordResetEmail(emailController.text)
                                  .catchError((onError) {
                                print(onError);
                              });
                              Toast.show(
                                  message:
                                      "Password reset email sent! Kindly check your email.",
                                  duration: Delay.LONG,
                                  textColor: Colors.black);
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
            ],
          )
        ],
      ),
    );
  }
}
