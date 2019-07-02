import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Timetable extends StatefulWidget {
  @override
  _TimetableState createState() => _TimetableState();
}

class _TimetableState extends State<Timetable> {
  String A = "a", B = "b", C = "c", D = "d", E = "e", F = "f", G = "g";

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future<Null> getSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      A = prefs.getString('A');

      B = prefs.getString('B');

      C = prefs.getString('C');

      D = prefs.getString('D');

      E = prefs.getString('E');

      F = prefs.getString('F');

      G = prefs.getString('G');
    });
  }

  @override
  void initState()  {
    super.initState();
       getSharedPrefs();  

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Table(
              columnWidths: const <int, TableColumnWidth>{},
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              border: TableBorder.all(
                  color: const Color(0xFFFFFFFF),
                  width: 1.0,
                  style: BorderStyle.solid),
              children: [
                TableRow(children: [
                  Center(
                      child: Text(
                    "\n FROM \n",
                    style: TextStyle(fontSize: 10),
                  )),
                  Center(child: Text("08:00", style: TextStyle(fontSize: 10))),
                  Center(child: Text("08:50", style: TextStyle(fontSize: 10))),
                  Center(child: Text("09:45", style: TextStyle(fontSize: 10))),
                  Center(child: Text("10:40", style: TextStyle(fontSize: 10))),
                  Center(child: Text("11:35", style: TextStyle(fontSize: 10))),
                  Center(child: Text("12:30", style: TextStyle(fontSize: 10))),
                  Center(child: Text("01:25", style: TextStyle(fontSize: 10))),
                  Center(child: Text("02:20", style: TextStyle(fontSize: 10))),
                  Center(child: Text("03:15", style: TextStyle(fontSize: 10))),
                  Center(child: Text("04:05", style: TextStyle(fontSize: 10))),
                ]),
                TableRow(children: [
                  Center(
                      child: Text(
                    "\nTO \n",
                    style: TextStyle(fontSize: 10),
                  )),
                  Center(child: Text("08:50", style: TextStyle(fontSize: 10))),
                  Center(child: Text("09:45", style: TextStyle(fontSize: 10))),
                  Center(child: Text("10:40", style: TextStyle(fontSize: 10))),
                  Center(child: Text("11:35", style: TextStyle(fontSize: 10))),
                  Center(child: Text("12:30", style: TextStyle(fontSize: 10))),
                  Center(child: Text("01:25", style: TextStyle(fontSize: 10))),
                  Center(child: Text("02:20", style: TextStyle(fontSize: 10))),
                  Center(child: Text("03:15", style: TextStyle(fontSize: 10))),
                  Center(child: Text("04:05", style: TextStyle(fontSize: 10))),
                  Center(child: Text("04:55", style: TextStyle(fontSize: 10))),
                ]),
                TableRow(children: [
                  Center(
                      child: Text(
                    "\nHOUR/D.O \n",
                    style: TextStyle(fontSize: 10),
                  )),
                  Center(child: Text("1", style: TextStyle(fontSize: 10))),
                  Center(child: Text("2", style: TextStyle(fontSize: 10))),
                  Center(child: Text("3", style: TextStyle(fontSize: 10))),
                  Center(child: Text("4", style: TextStyle(fontSize: 10))),
                  Center(child: Text("5", style: TextStyle(fontSize: 10))),
                  Center(child: Text("6", style: TextStyle(fontSize: 10))),
                  Center(child: Text("7", style: TextStyle(fontSize: 10))),
                  Center(child: Text("8", style: TextStyle(fontSize: 10))),
                  Center(child: Text("9", style: TextStyle(fontSize: 10))),
                  Center(child: Text("10", style: TextStyle(fontSize: 10))),
                ]),
                TableRow(children: [
                  Center(
                      child: Text(
                    "\nDay 1 \n",
                    style: TextStyle(fontSize: 10),
                  )),
                  Center(child: Text("1", style: TextStyle(fontSize: 10))),
                  Center(child: Text("2", style: TextStyle(fontSize: 10))),
                  Center(child: Text("3", style: TextStyle(fontSize: 10))),
                  Center(child: Text("4", style: TextStyle(fontSize: 10))),
                  Center(child: Text("5", style: TextStyle(fontSize: 10))),
                  Center(child: Text(A, style: TextStyle(fontSize: 10))),
                  Center(child: Text(A, style: TextStyle(fontSize: 10))),
                  Center(child: Text(F, style: TextStyle(fontSize: 10))),
                  Center(child: Text(F, style: TextStyle(fontSize: 10))),
                  Center(child: Text(D, style: TextStyle(fontSize: 10))),
                ]),
                TableRow(children: [
                  Center(
                      child: Text(
                    "\nDay 2 \n",
                    style: TextStyle(fontSize: 10),
                  )),
                  Center(child: Text(B, style: TextStyle(fontSize: 10))),
                  Center(child: Text(B, style: TextStyle(fontSize: 10))),
                  Center(child: Text(G, style: TextStyle(fontSize: 10))),
                  Center(child: Text(G, style: TextStyle(fontSize: 10))),
                  Center(child: Text(A, style: TextStyle(fontSize: 10))),
                  Center(child: Text("6", style: TextStyle(fontSize: 10))),
                  Center(child: Text("7", style: TextStyle(fontSize: 10))),
                  Center(child: Text("8", style: TextStyle(fontSize: 10))),
                  Center(child: Text("9", style: TextStyle(fontSize: 10))),
                  Center(child: Text("10", style: TextStyle(fontSize: 10))),
                ]),
                TableRow(children: [
                  Center(
                      child: Text(
                    "\nDay 3 \n",
                    style: TextStyle(fontSize: 10),
                  )),
                  Center(child: Text(C, style: TextStyle(fontSize: 10))),
                  Center(child: Text(C, style: TextStyle(fontSize: 10))),
                  Center(child: Text(E, style: TextStyle(fontSize: 10))),
                  Center(child: Text(F, style: TextStyle(fontSize: 10))),
                  Center(child: Text(D, style: TextStyle(fontSize: 10))),
                  Center(child: Text("6", style: TextStyle(fontSize: 10))),
                  Center(child: Text("7", style: TextStyle(fontSize: 10))),
                  Center(child: Text("8", style: TextStyle(fontSize: 10))),
                  Center(child: Text("9", style: TextStyle(fontSize: 10))),
                  Center(child: Text("10", style: TextStyle(fontSize: 10))),
                ]),
                TableRow(children: [
                  Center(
                      child: Text(
                    "\nDay 4 \n",
                    style: TextStyle(fontSize: 10),
                  )),
                  Center(child: Text(D, style: TextStyle(fontSize: 10))),
                  Center(child: Text(D, style: TextStyle(fontSize: 10))),
                  Center(child: Text(B, style: TextStyle(fontSize: 10))),
                  Center(child: Text(C, style: TextStyle(fontSize: 10))),
                  Center(child: Text(G, style: TextStyle(fontSize: 10))),
                  Center(child: Text("6", style: TextStyle(fontSize: 10))),
                  Center(child: Text("7", style: TextStyle(fontSize: 10))),
                  Center(child: Text("8", style: TextStyle(fontSize: 10))),
                  Center(child: Text("9", style: TextStyle(fontSize: 10))),
                  Center(child: Text("10", style: TextStyle(fontSize: 10))),
                ]),
                TableRow(children: [
                  Center(
                      child: Text(
                    "\nDay 5 \n",
                    style: TextStyle(fontSize: 10),
                  )),
                  Center(child: Text("1", style: TextStyle(fontSize: 10))),
                  Center(child: Text("2", style: TextStyle(fontSize: 10))),
                  Center(child: Text("3", style: TextStyle(fontSize: 10))),
                  Center(child: Text("4", style: TextStyle(fontSize: 10))),
                  Center(child: Text("5", style: TextStyle(fontSize: 10))),
                  Center(child: Text(E, style: TextStyle(fontSize: 10))),
                  Center(child: Text(E, style: TextStyle(fontSize: 10))),
                  Center(child: Text(A, style: TextStyle(fontSize: 10))),
                  Center(child: Text(B, style: TextStyle(fontSize: 10))),
                  Center(child: Text(C, style: TextStyle(fontSize: 10))),
                ]),
              ]),
        ],
      )),
    );
  }
}
