import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'auth.dart';
import 'package:flutter_just_toast/flutter_just_toast.dart';

class ProfileTwo extends StatefulWidget {
  @override
  _ProfileTwoState createState() => _ProfileTwoState();
}

class _ProfileTwoState extends State<ProfileTwo> {
  final Firestore _db = Firestore.instance;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  String dropdownBatch = 'Batch 1';
  String dropdownYear = '1st Year';

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Save your profile info"),
          content: new Text("Are you sure?"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Yes"),
              onPressed: () async {
                await _firebaseAuth.currentUser().then((userId) {
                  DocumentReference ref =
                      _db.collection("users").document(userId.uid);
                  ref.setData({
                    'year': dropdownYear,
                    'batch': dropdownBatch,
                    'lastSeen': DateTime.now(),
                  }, merge: true);
                });

                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text("No"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

  void _saveData() async {
    FocusScope.of(context).requestFocus(new FocusNode());
    _showDialog();
  }

  @override
  void initState() {
    super.initState();
    _firebaseAuth.currentUser().then((userId) async {
      var document =
          Firestore.instance.collection("users").document(userId.uid).get();
      await document.then((doc) {
        setState(() {
          dropdownBatch = doc['batch'];
          dropdownYear = doc['year'];
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Edit Profile"),
        ),
        body: Form(
          child: Container(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 20)),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: dropdownYear,
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownYear = newValue;
                      });
                    },
                    items: <String>[
                      '1st Year',
                      '2nd Year',
                      '3rd Year',
                      '4th Year'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20)),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: dropdownBatch,
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownBatch = newValue;
                      });
                    },
                    items: <String>['Batch 1', 'Batch 2']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20)),
                ButtonTheme(
                    minWidth: 100.0,
                    height: 50.0,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      color: Colors.green,
                      textColor: Colors.white,
                      child: Text("Save Profile and Proceed"),
                      onPressed: () async {
                        _saveData();
                      },
                    )),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                ),
              ],
            ),
          ),
        ));
  }
}
