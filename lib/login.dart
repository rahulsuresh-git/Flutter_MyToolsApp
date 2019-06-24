import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'home.dart';
import 'auth.dart';

class Login extends StatefulWidget {
  bool isLoggedIn;
  Login({this.isLoggedIn});
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    FirebaseAuth.instance.currentUser().then((user) {
      if (user == null) {
        return new Home();
      }
    });
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  Future<FirebaseUser> _signIn() async {
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;

    FirebaseUser user = await _auth
        .signInWithGoogle(idToken: gSA.idToken, accessToken: gSA.accessToken)
        .then((user) {
      return user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          MaterialButton(
              onPressed: () => _signIn(),
              color: Colors.white,
              textColor: Colors.black,
              child: Text("Login with Google")),
        ],
      )),
    );
  }
}
