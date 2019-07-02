import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TimetableInputTwo extends StatefulWidget {
  @override
  _TimetableInputTwoState createState() => _TimetableInputTwoState();
}

class _TimetableInputTwoState extends State<TimetableInputTwo> {
  bool _validate = true;
  final Firestore _db = Firestore.instance;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String dropdownPrac1 = "P1 P2";
    String dropdownPrac2 = "P1 P2";
  String dropdownPrac3 = "P1 P2";
  String dropdownPrac4 = "P1 P2";
  String dropdownPrac5 = "P1 P2";

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
          flex: 2,
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
              labelText: "Lab Slot",
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
              errorText: _validate
                  ? null
                  : 'Registration Number is not in the right format!',
            ),
            keyboardType: TextInputType.text,
            autocorrect: true,
          ),
        ),
      ],
    ),

       Row(
      children: <Widget>[
        new Flexible(
          flex: 2,
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
              labelText: "Lab Slot",
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
              errorText: _validate
                  ? null
                  : 'Registration Number is not in the right format!',
            ),
            keyboardType: TextInputType.text,
            autocorrect: true,
          ),
        ),
      ],
    ),    Row(
      children: <Widget>[
        new Flexible(
          flex: 2,
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
              labelText: "Lab Slot",
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
              errorText: _validate
                  ? null
                  : 'Registration Number is not in the right format!',
            ),
            keyboardType: TextInputType.text,
            autocorrect: true,
          ),
        ),
      ],
    ),
    Row(
      children: <Widget>[
        new Flexible(
          flex: 2,
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
              labelText: "Lab Slot",
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
              errorText: _validate
                  ? null
                  : 'Registration Number is not in the right format!',
            ),
            keyboardType: TextInputType.text,
            autocorrect: true,
          ),
        ),
      ],
    ),
    Row(
      children: <Widget>[
        new Flexible(
          flex: 2,
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
              labelText: "Lab Slot",
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
              errorText: _validate
                  ? null
                  : 'Registration Number is not in the right format!',
            ),
            keyboardType: TextInputType.text,
            autocorrect: true,
          ),
        ),
      ],
    ),     Padding(padding: EdgeInsets.only(top: 20)),
                Card(
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(24),
                    onTap: () {

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
