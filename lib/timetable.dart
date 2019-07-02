import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Timetable extends StatefulWidget {
  @override
  _TimetableState createState() => _TimetableState();
}

class _TimetableState extends State<Timetable> {
  String A = "a",
      B = "b",
      C = "c",
      D = "d",
      E = "e",
      F = "f",
      G = "g",
      P1=" ",
      P2=" ",
      P3=" ",
      P4=" ",
      P5=" ",
      P16=" ",
      P17=" ",
      P18=" ",
      P19=" ",
      P20=" ",
      P21=" ",
      P22=" ",
      P23=" ",
      P24=" ",
      P25=" ",
      P36=" ",
      P37=" ",
      P38=" ",
      P39=" ",
      P40=" ",
      P41=" ",
      P42=" ",
      P43=" ",
      P44=" ",
      P45=" ";
  String dropdownPrac1,
      dropdownPrac2,
      dropdownPrac3,
      dropdownPrac4,
      dropdownPrac5;
  String H = "P1 P2";
  String I = "P3 P4";
  String J = "P16 P17";
  String K = "P17 P18";
  String L = "P18 P19";
  String M = "P19 P20";
  String N = "P21 P22";
  String O = "P23 P24";
  String P = "P36 P37";
  String Q = "P37 P38";
  String R = "P38 P39";
  String S = "P39 P40";
  String T = "P41 P42";
  String U = "P43 P44";
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future<Null> getSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var temp=prefs.getString(H);
    print(temp);
    setState(() {
      A = prefs.getString('A');
      B = prefs.getString('B');
      C = prefs.getString('C');
      D = prefs.getString('D');
      E = prefs.getString('E');
      F = prefs.getString('F');
      G = prefs.getString('G');
    });
setState(() {
 P1=P2=P3=P4=P5=P16=P17=P18=P19=P20=P21=P22=P23=P24=P25=P36=P37=P38=P39=P40=P41=P42=P43=P44=P45=" "; 
});
 if(prefs.getString(H)!=null)
  {
    setState(() {
     P1=prefs.getString(H);
     P2=prefs.getString(H); 
    });
  }
  if(prefs.getString(I)!=null)
  {
    setState(() {
     P3=prefs.getString(I);
     P4=prefs.getString(I); 
    });
  }
  if(prefs.getString(J)!=null)
  {
    setState(() {
     P16=prefs.getString(J);
     P17=prefs.getString(J); 
    });
  }
  if(prefs.getString(K)!=null)
  {
    setState(() {
     P17=prefs.getString(K);
     P18=prefs.getString(K); 
    });
  }

if(prefs.getString(L)!=null)
  {
    setState(() {
     P18=prefs.getString(L);
     P19=prefs.getString(L); 
    });
  }if(prefs.getString(M)!=null)
  {
    setState(() {
     P19=prefs.getString(M);
     P20=prefs.getString(M); 
    });
  }if(prefs.getString(N)!=null)
  {
    setState(() {
     P21=prefs.getString(N);
     P22=prefs.getString(N); 
    });
  }if(prefs.getString(O)!=null)
  {
    setState(() {
     P23=prefs.getString(O);
     P24=prefs.getString(O); 
    });
  }if(prefs.getString(P)!=null)
  {
    setState(() {
     P36=prefs.getString(P);
     P37=prefs.getString(P); 
    });
  }if(prefs.getString(Q)!=null)
  {
    setState(() {
     P37=prefs.getString(Q);
     P38=prefs.getString(Q); 
    });
  }if(prefs.getString(R)!=null)
  {
    setState(() {
     P38=prefs.getString(R);
     P39=prefs.getString(R); 
    });
  }if(prefs.getString(S)!=null)
  {
    setState(() {
     P39=prefs.getString(S);
     P40=prefs.getString(S); 
    });
  }if(prefs.getString(T)!=null)
  {
    setState(() {
     P41=prefs.getString(T);
     P42=prefs.getString(T); 
    });
  }if(prefs.getString(U)!=null)
  {
    setState(() {
     P43=prefs.getString(U);
     P44=prefs.getString(U); 
    });
  }
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
        backgroundColor: Colors.blue,
        title: Text("My Daily Timetable"),
      ),
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
                  Center(child: Text(P1, style: TextStyle(fontSize: 10))),
                  Center(child: Text(P2, style: TextStyle(fontSize: 10))),
                  Center(child: Text(P3, style: TextStyle(fontSize: 10))),
                  Center(child: Text(P4, style: TextStyle(fontSize: 10))),
                  Center(child: Text(P5, style: TextStyle(fontSize: 10))),
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
                 Center(child: Text(P16, style: TextStyle(fontSize: 10))),
                  Center(child: Text(P17, style: TextStyle(fontSize: 10))),
                  Center(child: Text(P18, style: TextStyle(fontSize: 10))),
                  Center(child: Text(P19, style: TextStyle(fontSize: 10))),
                  Center(child: Text(P20, style: TextStyle(fontSize: 10))),
                ]),
                TableRow(children: [
                  Center(
                      child: Text(
                    "\nDay 3 \n",
                    style: TextStyle(fontSize: 10),
                  )),Center(child: Text(P21, style: TextStyle(fontSize: 10))),
                  Center(child: Text(P22, style: TextStyle(fontSize: 10))),
                  Center(child: Text(P23, style: TextStyle(fontSize: 10))),
                  Center(child: Text(P24, style: TextStyle(fontSize: 10))),
                  Center(child: Text(P25, style: TextStyle(fontSize: 10))),
                  Center(child: Text(C, style: TextStyle(fontSize: 10))),
                  Center(child: Text(C, style: TextStyle(fontSize: 10))),
                  Center(child: Text(E, style: TextStyle(fontSize: 10))),
                  Center(child: Text(F, style: TextStyle(fontSize: 10))),
                  Center(child: Text(D, style: TextStyle(fontSize: 10))),
             
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
                  Center(child: Text(P36, style: TextStyle(fontSize: 10))),
                  Center(child: Text(P37, style: TextStyle(fontSize: 10))),
                  Center(child: Text(P38, style: TextStyle(fontSize: 10))),
                  Center(child: Text(P39, style: TextStyle(fontSize: 10))),
                  Center(child: Text(P40, style: TextStyle(fontSize: 10))),
                ]),
                TableRow(children: [
                  Center(
                      child: Text(
                    "\nDay 5 \n",
                    style: TextStyle(fontSize: 10),
                  )),
                  Center(child: Text(P41, style: TextStyle(fontSize: 10))),
                  Center(child: Text(P42, style: TextStyle(fontSize: 10))),
                  Center(child: Text(P43, style: TextStyle(fontSize: 10))),
                  Center(child: Text(P44, style: TextStyle(fontSize: 10))),
                  Center(child: Text(P45, style: TextStyle(fontSize: 10))),
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
