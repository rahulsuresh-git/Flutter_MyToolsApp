import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'auth.dart';
import 'package:flutter_just_toast/flutter_just_toast.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final regController = TextEditingController();
  bool _validate = true;
  final Firestore _db = Firestore.instance;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  String dropdownYear = '1st Year';
  String dropdownGender = 'Male';
  String dropdownBatch = 'Batch 1';

  String dropdownBranch = 'Aerospace Engineering';

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
                    'regNo': regController.text,
                    'year': dropdownYear,
                    'gender': dropdownGender,
                    'branch': dropdownBranch,
                    'batch': dropdownBatch,
                    'lastSeen': DateTime.now(),
                    'profile': true,
                  }, merge: true);
                });

                Navigator.of(context).pop();
                                      Navigator.pushReplacementNamed(context, '/home');

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
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("My Profile"),
        ),
        body: Form(
          child: Container(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(15),
                  ],
                  decoration: InputDecoration(
                    labelText: "Registration Number",
                    labelStyle: TextStyle(color: Colors.green),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    errorText: _validate
                        ? null
                        : 'Registration Number is not in the right format!',
                  ),
                  keyboardType: TextInputType.text,
                  autocorrect: true,
                  controller: regController,
                ),
                Padding(padding: EdgeInsets.only(top: 20)),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: dropdownGender,
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownGender = newValue;
                      });
                    },
                    items: <String>['Male', 'Female', 'Other']
                        .map<DropdownMenuItem<String>>((String value) {
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
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: dropdownBranch,
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownBranch = newValue;
                      });
                    },
                    items: <String>[
                      "Aerospace Engineering",
                      "Automobile Engineering",
                      "Automobile Engineering (Splzn: Automotive Electronics)",
                      "Biomedical Engineering",
                      "Biotechnology",
                      "Chemical Engineering",
                      "Civil Engineering",
                      "Computer Science and Engineering",
                      "Electrical and Electronics Engineering",
                      "Electronics and Communication Engineering",
                      "Electronics and Instrumentation Engineering",
                      "Genetic Engineering",
                      "Information Technology",
                      "Mechanical Engineering",
                      "Mechatronics Engineering",
                      "Nanotechnology",
                      "Software Engineering"
                    ].map<DropdownMenuItem<String>>((String value) {
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
                        bool regValid =
                            RegExp(r"^RA(\d){13}").hasMatch(regController.text);
                        if ((regController.text.isEmpty) || regValid == false) {
                          setState(() {
                            _validate = false;
                          });
                        } else {
                          setState(() {
                            _validate = true;
                          });
                        }
                        _validate ? _saveData() : null;
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
