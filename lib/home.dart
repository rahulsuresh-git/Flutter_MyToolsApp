import 'dart:async';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth.dart';
import 'package:flutter_just_toast/flutter_just_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';

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
  bool net = false;
  String tt = "true";
  String _photoUrl = "";
  bool _profile = false;
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  String _batch = "";
  String _year = "";

  Future<Null> getSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _firebaseAuth.currentUser().then((userId) async {
      var document =
          Firestore.instance.collection("users").document(userId.uid).get();
      await document.then((doc) {
        setState(() {
          _batch = doc['batch'];
          _year = doc['year'];
        });
        prefs.setString('batch', _batch);
        prefs.setString('year', _year);

        if (doc['profile'] == null || doc['profile'] == false) {
          setState(() {
            _profile = false;
          });
        } else if (doc['profile'] == true) {
          setState(() {
            _profile = true;
          });
        }
      });
      var temp = userId.displayName.split(' ');
      setState(() {
        _userName = temp[0];
        _photoUrl = userId.photoUrl;
      });
      await getTTInfo();
    });
  }

  Future<Null> getTTInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getString('tt') == null) {
      setState(() {
        tt = "false";
      });
    } else {
      setState(() {
        tt = prefs.getString('tt');
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getSharedPrefs();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("SRM MyTools v5.0"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 40),
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
            padding: EdgeInsets.only(top: 30),
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
          _profile ? Edit() : Text(""),
          Padding(
            padding: EdgeInsets.only(top: 50),
          ),
          Card(
            color: Colors.green[400],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(30),
              onTap: () async {
                try {
                  final result = await InternetAddress.lookup('google.com');
                  if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
                    setState(() {
                      net = true;
                    });
                  }
                } on SocketException catch (_) {
                  setState(() {
                    net = false;
                  });
                }
                if (net) {
                  if (!_profile || _profile == null)
                    Navigator.pushNamed(context, '/profile');
                  else {
                    Navigator.pushNamed(context, '/timetableInput');
                    setState(() {
                      tt = "false";
                    });
                  }
                } else {
                  Toast.show(
                      message:
                          "Internet connection needed to create/modify timetable",
                      duration: Delay.LONG,
                      textColor: Colors.black);
                }
              },
              child: Container(
                height: 70,
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
              onTap: () async {
                await getTTInfo();
                if (tt != "false") {
                  if (_batch == "Batch 1") {
                    Navigator.pushNamed(context, '/timetableOne');
                  } else {
                    Navigator.pushNamed(context, '/timetable');
                  }
                } else {
                  Toast.show(
                      message: "Kindly create a timetable first!",
                      duration: Delay.LONG,
                      textColor: Colors.black);
                }
              },
              child: Container(
                height: 70,
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
                    height: 70,
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
          ),
          Padding(
              padding: EdgeInsets.only(
            top: 20,
          )),
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
        ],
      ),
    );
  }
}

class Edit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 10),
        ),
        Card(
          color: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(24),
            onTap: () {
              Navigator.pushNamed(context, '/profileTwo');
            },
            child: Container(
              height: 35,
              width: 100,
              child: Center(
                child: Text(
                  'Edit Batch',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
