import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'auth.dart';
import 'main.dart';

class Home extends StatelessWidget {
  final bool isLoggedIn;
  Home({Key key, this.isLoggedIn}) : super(key: key);

  _signOut() {
    FirebaseAuth.instance.signOut();
    print("logged out");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: MaterialButton(
          onPressed: _signOut,
          textColor: Colors.white,
          child: Text("logout"),
          color: Colors.red,
        ),
      ),
    );
  }
}
