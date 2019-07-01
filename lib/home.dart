import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'auth.dart';
import 'package:flutter_just_toast/flutter_just_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mytools_flutter/form.dart';

class Home extends StatefulWidget {
  Home({this.auth, this.onSignOut});
  final BaseAuth auth;
  final VoidCallback onSignOut;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
    final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseUser userTemp;
  String _userName = "";
  String uid;
  String _photoUrl = "";
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  void _showDialog() {
    // flutter defined function
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Alert Dialog title"),
          content: Form(          key: this._formKey,

              child: new ListView(children: <Widget>[
            new TextFormField(
              keyboardType: TextInputType
                  .emailAddress, // Use email input type for emails.
              decoration: new InputDecoration(
                  hintText: 'you@example.com', labelText: 'E-mail Address'),
            ),
            new TextFormField(
              obscureText: true, // Use secure text for passwords.
              decoration: new InputDecoration(
                  hintText: 'Password', labelText: 'Enter your password'),
            )
          ])),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _firebaseAuth.currentUser().then((userId) {
      var temp = userId.displayName.split(' ');
      setState(() {
        _userName = temp[0];
        _photoUrl = userId.photoUrl;
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("SRM MyTools v5.0"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 50),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Text("Hey ",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w100,
                    fontSize: 25)),
            Text(_userName + "!",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 25)),
          ]),
          Padding(
            padding: EdgeInsets.only(top: 25),
          ),
          new Container(
            width: 100.0,
            height: 100.0,
            decoration: new BoxDecoration(
              color: const Color(0xff7c94b6),
              image: new DecorationImage(
                image: new NetworkImage(_photoUrl),
                fit: BoxFit.cover,
              ),
              borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
              border: new Border.all(
                color: Colors.white,
                width: 4.0,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
          ),
          Card(
            color: Colors.green[400],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(30),
              onTap: _showDialog,
              child: Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Text(
                    'Create Timetable',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                  ),
                ),
              ),
            ),
          ),
          Card(
            color: Colors.amber,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(30),
              onTap: () {},
              child: Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Text(
                    'View Timetable',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                  ),
                ),
              ),
            ),
          ),
          Card(
            color: Colors.red[300],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Stack(
              children: <Widget>[
                InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () async {
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
                  child: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Text(
                        'Logout',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
