import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'auth.dart';
import 'package:flutter_just_toast/flutter_just_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Home extends StatefulWidget {
  Home({this.auth, this.onSignOut});
  final BaseAuth auth;
  final VoidCallback onSignOut;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  String uid;

  var refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
          color: Color(0xffffffff),
          elevation: 30,
          child: Container(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  FlatButton(
                    onPressed: () => {Navigator.of(context).pushNamed('/post')},
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      // Replace with a Row for horizontal icon + text
                      children: <Widget>[
                        Icon(Icons.add),
                        Text("Post"),
                      ],
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      try {
                        await _firebaseAuth.signOut();
                        print("Signed out");
                        if (Navigator.pop(context) == null)
                          Navigator.pushNamed(context, '/root');
                        Navigator.pushReplacementNamed(context, '/root');
                      } catch (e) {
                        var error = e.message;
                        Toast.show(
                            message: "Error : $error",
                            duration: Delay.LONG,
                            textColor: Colors.black);
                      }
                    },
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      // Replace with a Row for horizontal icon + text
                      children: <Widget>[
                        Icon(Icons.exit_to_app),
                        Text("Logout")
                      ],
                    ),
                  ),
                ],
              ))),
      appBar: AppBar(
        backgroundColor: Color(0xff2b2b2b),
        title: Text("Amazon TabTalk v1.0"),
      ),
      body: Center(child: Text("hi")),
    );
  }
}
  