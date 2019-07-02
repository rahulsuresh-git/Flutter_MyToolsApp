import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TimetableInputTwoBTwo extends StatefulWidget {
  @override
  _TimetableInputTwoBTwoState createState() => _TimetableInputTwoBTwoState();
}

class _TimetableInputTwoBTwoState extends State<TimetableInputTwoBTwo> {
  final _labOne = TextEditingController();
  final _labTwo = TextEditingController();
  final _labThree = TextEditingController();
  final _labFour = TextEditingController();
  final _labFive = TextEditingController();

  bool _validate = true;
  final Firestore _db = Firestore.instance;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String dropdownPrac1 = "Select";
  String dropdownPrac2 = "Select";
  String dropdownPrac3 = "Select";
  String dropdownPrac4 = "Select";
  String dropdownPrac5 = "Select";
  String _batch = "";
  Future<Null> getSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
  setState(() {
        _batch = prefs.getString('batch');
      });
    // if (dropdownPrac1 != null)
    //   setState(() {
    //     dropdownPrac1 = prefs.getString('dropdownPrac1');
    //   });
    // else {
    //   setState(() {
    //     dropdownPrac1 = "Select";
    //   });
    // }

    // if (dropdownPrac2 != null)
    //   setState(() {
    //     dropdownPrac2 = prefs.getString('dropdownPrac2');
    //   });
    // else {
    //   setState(() {
    //     dropdownPrac2 = "Select";
    //   });
    // }
    // if (dropdownPrac3 != null)
    //   setState(() {
    //     dropdownPrac3 = prefs.getString('dropdownPrac3');
    //   });
    // else {
    //   setState(() {
    //     dropdownPrac3 = "Select";
    //   });
    // }
    // if (dropdownPrac4 != null)
    //   setState(() {
    //     dropdownPrac4 = prefs.getString('dropdownPrac4');
    //   });
    // else {
    //   setState(() {
    //     dropdownPrac4= "Select";
    //   });
    // }
    // if (dropdownPrac5 != null)
    //   setState(() {
    //     dropdownPrac5 = prefs.getString('dropdownPrac5');
    //   });
    // else {
    //   setState(() {
    //     dropdownPrac5 = "Select";
    //   });
    // }
    // setState(() {
    //   _labOne.text = prefs.getString('_labOne');
    //   _labTwo.text = prefs.getString('_labTwo');
    //   _labThree.text = prefs.getString('_labThree');
    //   _labFour.text = prefs.getString('_labFour');
    //   _labFive.text = prefs.getString('_labFive');
    // });
  }

  asyncFunc() async {
    // Async func to handle Futures easier; or use Future.then
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('dropdownPrac1', dropdownPrac1);
    prefs.setString('dropdownPrac2', dropdownPrac2);
    prefs.setString('dropdownPrac3', dropdownPrac3);
    prefs.setString('dropdownPrac4', dropdownPrac4);
    prefs.setString('dropdownPrac5', dropdownPrac5);
    prefs.setString('_labOne', _labOne.text);
    prefs.setString('_labTwo', _labTwo.text);
    prefs.setString('_labThree', _labThree.text);
    prefs.setString('_labFour', _labFour.text);
    prefs.setString('_labFive', _labFive.text);
  }

  @override
  void initState() {
    super.initState();
    getSharedPrefs();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Text("Step Two"),
        ),
        body: Form(
          child: Container(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("Practical Slots",
                    style:
                        TextStyle(fontWeight: FontWeight.w200, fontSize: 20)),
                Padding(padding: EdgeInsets.only(top: 5)),
                Card(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Container(
                    height: 35,
                    width: 160,
                    child: Center(
                      child: Text(
                        'You are in ' + _batch,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20)),
                Center(
                  child: Text("Note: Type in the format 'SUBJECT+VENUE'",
                      style:
                          TextStyle(fontWeight: FontWeight.w200, fontSize: 15)),
                ),
                Center(
                  child: Text("Example: OS LAB TP601",
                      style:
                          TextStyle(fontWeight: FontWeight.w200, fontSize: 15)),
                ),
                Row(
                  children: <Widget>[
                    new Flexible(
                      flex: 1,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(padding: EdgeInsets.only(top: 20)),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: DropdownButton<String>(
                                isExpanded: true,
                                value: dropdownPrac1,
                                onChanged: (String newValue) {
                                  setState(() {
                                    dropdownPrac1 = newValue;
                                  });
                                },
                                items: <String>[
                                  "Select",
                                  "P1 P2",
                                  "P3 P4",
                                  "P16 P17",
                                  "P17 P18",
                                  "P18 P19",
                                  "P19 P20",
                                  "P21 P22",
                                  "P23 P24",
                                  "P36 P37",
                                  "P37 P38",
                                  "P38 P39",
                                  "P39 P40",
                                  "P41 P42",
                                  "P43 P44"
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                    ),
                    new Flexible(
                      child: TextFormField(
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(15),
                        ],
                        decoration: InputDecoration(
                          labelText: "Subject+Venue",
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                          errorText: _validate
                              ? null
                              : 'Registration Number is not in the right format!',
                        ),
                        keyboardType: TextInputType.text,
                        autocorrect: true,
                        controller: _labOne,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    new Flexible(
                      flex: 1,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(padding: EdgeInsets.only(top: 20)),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: DropdownButton<String>(
                                isExpanded: true,
                                value: dropdownPrac2,
                                onChanged: (String newValue) {
                                  setState(() {
                                    dropdownPrac2 = newValue;
                                  });
                                },
                                items: <String>[
                                  "Select",
                                  "P1 P2",
                                  "P3 P4",
                                  "P16 P17",
                                  "P17 P18",
                                  "P18 P19",
                                  "P19 P20",
                                  "P21 P22",
                                  "P23 P24",
                                  "P36 P37",
                                  "P37 P38",
                                  "P38 P39",
                                  "P39 P40",
                                  "P41 P42",
                                  "P43 P44"
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                    ),
                    new Flexible(
                      child: TextFormField(
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(15),
                        ],
                        decoration: InputDecoration(
                          labelText: "Subject+Venue",
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                          errorText: _validate
                              ? null
                              : 'Registration Number is not in the right format!',
                        ),
                        keyboardType: TextInputType.text,
                        autocorrect: true,
                        controller: _labTwo,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    new Flexible(
                      flex: 1,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(padding: EdgeInsets.only(top: 20)),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: DropdownButton<String>(
                                isExpanded: true,
                                value: dropdownPrac3,
                                onChanged: (String newValue) {
                                  setState(() {
                                    dropdownPrac3 = newValue;
                                  });
                                },
                                items: <String>[
                                  "Select",
                                  "P1 P2",
                                  "P3 P4",
                                  "P16 P17",
                                  "P17 P18",
                                  "P18 P19",
                                  "P19 P20",
                                  "P21 P22",
                                  "P23 P24",
                                  "P36 P37",
                                  "P37 P38",
                                  "P38 P39",
                                  "P39 P40",
                                  "P41 P42",
                                  "P43 P44"
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                    ),
                    new Flexible(
                      child: TextFormField(
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(15),
                        ],
                        decoration: InputDecoration(
                          labelText: "Subject+Venue",
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                          errorText: _validate
                              ? null
                              : 'Registration Number is not in the right format!',
                        ),
                        keyboardType: TextInputType.text,
                        autocorrect: true,
                        controller: _labThree,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    new Flexible(
                      flex: 1,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(padding: EdgeInsets.only(top: 20)),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: DropdownButton<String>(
                                isExpanded: true,
                                value: dropdownPrac4,
                                onChanged: (String newValue) {
                                  setState(() {
                                    dropdownPrac4 = newValue;
                                  });
                                },
                                items: <String>[
                                  "Select",
                                  "P1 P2",
                                  "P3 P4",
                                  "P16 P17",
                                  "P17 P18",
                                  "P18 P19",
                                  "P19 P20",
                                  "P21 P22",
                                  "P23 P24",
                                  "P36 P37",
                                  "P37 P38",
                                  "P38 P39",
                                  "P39 P40",
                                  "P41 P42",
                                  "P43 P44"
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                    ),
                    new Flexible(
                      child: TextFormField(
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(15),
                        ],
                        decoration: InputDecoration(
                          labelText: "Subject+Venue",
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                          errorText: _validate
                              ? null
                              : 'Registration Number is not in the right format!',
                        ),
                        keyboardType: TextInputType.text,
                        autocorrect: true,
                        controller: _labFour,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    new Flexible(
                      flex: 1,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(padding: EdgeInsets.only(top: 20)),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: DropdownButton<String>(
                                isExpanded: true,
                                value: dropdownPrac5,
                                onChanged: (String newValue) {
                                  setState(() {
                                    dropdownPrac5 = newValue;
                                  });
                                },
                                items: <String>[
                                  "Select",
                                  "P1 P2",
                                  "P3 P4",
                                  "P16 P17",
                                  "P17 P18",
                                  "P18 P19",
                                  "P19 P20",
                                  "P21 P22",
                                  "P23 P24",
                                  "P36 P37",
                                  "P37 P38",
                                  "P38 P39",
                                  "P39 P40",
                                  "P41 P42",
                                  "P43 P44"
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                    ),
                    new Flexible(
                      child: TextFormField(
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(15),
                        ],
                        decoration: InputDecoration(
                          labelText: "Subject+Venue",
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                          errorText: _validate
                              ? null
                              : 'Registration Number is not in the right format!',
                        ),
                        keyboardType: TextInputType.text,
                        autocorrect: true,
                        controller: _labFive,
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 20)),
                Card(
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(24),
                    onTap: () async {
                      await asyncFunc();
                      await _firebaseAuth.currentUser().then((userId) {
                        DocumentReference ref =
                            _db.collection("timetable").document(userId.uid);
                        ref.setData({
                          dropdownPrac1: _labOne.text,
                          dropdownPrac2: _labTwo.text,
                          dropdownPrac3: _labThree.text,
                          dropdownPrac4: _labFour.text,
                          dropdownPrac5: _labFive.text,
                        }, merge: true);
                        print("done");
                      });

                      Navigator.pop(context);
                      Navigator.pushReplacementNamed(context, '/timetable');
                    },
                    child: Container(
                      height: 50,
                      width: 200,
                      child: Center(
                        child: Text(
                          'Save and Build',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w300),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
