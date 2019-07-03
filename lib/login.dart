import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'auth.dart';
import 'package:flutter_just_toast/flutter_just_toast.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class Login extends StatefulWidget {
  Login({Key key, this.auth, this.onSignIn}) : super(key: key);

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
        vsync: this, duration: Duration(milliseconds: 600));

    _iconAnimation = CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.easeOut);

    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Stack(
        children: [
          new Container(
            height: 50.0,
            color: Colors.white,
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            top: 0.0,
            bottom: 0.0,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Developed with ", style: TextStyle(color: Colors.grey)),
                    Icon(
                      Icons.favorite,
                      size: 20,
                      color: Colors.red[400],
                    ),
                    Text(" by ", style: TextStyle(color: Colors.grey)),
                    new InkWell(
                      child: new Text(
                        "Rahul",
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                      onTap: () =>
                          launch('https://www.linkedin.com/in/rahulsuresh98/'),
                    )
                  ],
                ),
                Padding(padding:EdgeInsets.only(top:5)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                   
                    new InkWell(
                      child: new Text(
                        "Privacy Policy",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      onTap: () => launch('https://textuploader.com/1dw1q'),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
             Image(image: AssetImage('assets/logo.png'),width: _iconAnimation.value*150,),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Text("SRM MyTools v5.0",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w200)),
              Padding(
                padding: EdgeInsets.all(20),
              ),
              GoogleSignInButton(
                borderRadius: 30,

                onPressed: () async {
                  try {
                    String userId = await widget.auth.googleSignIn();
                    print(userId);
                    Navigator.pushNamed(context, '/home');
                  } catch (e) {
                    var error = e.message;
                    Toast.show(
                        message: "Error : $error",
                        duration: Delay.LONG,
                        textColor: Colors.black);
                  }
                },
                darkMode: false, // default: false
              ),
            ],
          )
        ],
      ),
    );
  }
}
