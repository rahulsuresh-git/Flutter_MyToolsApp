import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TimetableOne extends StatefulWidget {
  @override
  _TimetableOneState createState() => _TimetableOneState();
}

class _TimetableOneState extends State<TimetableOne> {
  String A = "a",
      B = "b",
      C = "c",
      D = "d",
      E = "e",
      F = "f",
      G = "g",
      P6 = " ",
      P7 = " ",
      P8 = " ",
      P9 = " ",
      P10 = " ",
      P11 = " ",
      P12 = " ",
      P13 = " ",
      P14 = " ",
      P15 = " ",
      P26 = " ",
      P27 = " ",
      P28 = " ",
      P29 = " ",
      P30 = " ",
      P31 = " ",
      P32 = " ",
      P33 = " ",
      P34 = " ",
      P35 = " ",
      P46 = " ",
      P47 = " ",
      P48 = " ",
      P49 = " ",
      P50 = " ";
  String dropdownPrac1,
      dropdownPrac2,
      dropdownPrac3,
      dropdownPrac4,
      dropdownPrac5;
  String H = "P6 P7";
  String I = "P7 P8";
  String J = "P8 P9";
  String K = "P9 P10";
  String L = "P11 P12";
  String M = "P13 P14";
  String N = "P26 P27";
  String O = "P27 P28";
  String P = "P28 P29";
  String Q = "P29 P30";
  String R = "P31 P32";
  String S = "P33 P34";
  String T = "P46 P47";
  String U = "P47 P48";
  String V = "P48 P49";
  String W = "P49 P50";

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

    if (prefs.getString(H) != null) {
      setState(() {
        P6 = prefs.getString(H);
        P7 = prefs.getString(H);
      });
    }
    if (prefs.getString(I) != null) {
      setState(() {
        P7 = prefs.getString(I);
        P8 = prefs.getString(I);
      });
    }
    if (prefs.getString(J) != null) {
      setState(() {
        P8 = prefs.getString(J);
        P9 = prefs.getString(J);
      });
    }
    if (prefs.getString(K) != null) {
      setState(() {
        P9 = prefs.getString(K);
        P10 = prefs.getString(K);
      });
    }

    if (prefs.getString(L) != null) {
      setState(() {
        P11 = prefs.getString(L);
        P12 = prefs.getString(L);
      });
    }
    if (prefs.getString(M) != null) {
      setState(() {
        P13 = prefs.getString(M);
        P14 = prefs.getString(M);
      });
    }
    if (prefs.getString(N) != null) {
      setState(() {
        P26 = prefs.getString(N);
        P27 = prefs.getString(N);
      });
    }
    if (prefs.getString(O) != null) {
      setState(() {
        P27 = prefs.getString(O);
        P28 = prefs.getString(O);
      });
    }
    if (prefs.getString(P) != null) {
      setState(() {
        P28 = prefs.getString(P);
        P29 = prefs.getString(P);
      });
    }
    if (prefs.getString(Q) != null) {
      setState(() {
        P29 = prefs.getString(Q);
        P30 = prefs.getString(Q);
      });
    }
    if (prefs.getString(R) != null) {
      setState(() {
        P31 = prefs.getString(R);
        P32 = prefs.getString(R);
      });
    }
    if (prefs.getString(S) != null) {
      setState(() {
        P33 = prefs.getString(S);
        P34 = prefs.getString(S);
      });
    }
    if (prefs.getString(T) != null) {
      setState(() {
        P46 = prefs.getString(T);
        P47 = prefs.getString(T);
      });
    }
    if (prefs.getString(U) != null) {
      setState(() {
        P47 = prefs.getString(U);
        P48 = prefs.getString(U);
      });
    }
    if (prefs.getString(V) != null) {
      setState(() {
        P48 = prefs.getString(V);
        P49 = prefs.getString(V);
      });
    }
    if (prefs.getString(W) != null) {
      setState(() {
        P49 = prefs.getString(W);
        P50 = prefs.getString(W);
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
     FirebaseAdMob.instance
        .initialize(appId: "ca-app-pub-8068139846844354~2057510565")
        .then((onValue) {
      myBanner
        ..load()
        ..show();
    });
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
                  Center(child: Text(A, style: TextStyle(fontSize: 10))),
                  Center(child: Text(A, style: TextStyle(fontSize: 10))),
                  Center(child: Text(F, style: TextStyle(fontSize: 10))),
                  Center(child: Text(F, style: TextStyle(fontSize: 10))),
                  Center(child: Text(D, style: TextStyle(fontSize: 10))),
                  Center(child: Text(P6, style: TextStyle(fontSize: 10))),
                  Center(child: Text(P7, style: TextStyle(fontSize: 10))),
                  Center(child: Text(P8, style: TextStyle(fontSize: 10))),
                  Center(child: Text(P9, style: TextStyle(fontSize: 10))),
                  Center(child: Text(P10, style: TextStyle(fontSize: 10))),
                ]),
                TableRow(children: [
                  Center(
                      child: Text(
                    "\nDay 2 \n",
                    style: TextStyle(fontSize: 10),
                  )),
                  Center(child: Text(P11, style: TextStyle(fontSize: 10))),
                  Center(child: Text(P12, style: TextStyle(fontSize: 10))),
                  Center(child: Text(P13, style: TextStyle(fontSize: 10))),
                  Center(child: Text(P14, style: TextStyle(fontSize: 10))),
                  Center(child: Text(P15, style: TextStyle(fontSize: 10))),
                  Center(child: Text(B, style: TextStyle(fontSize: 10))),
                  Center(child: Text(B, style: TextStyle(fontSize: 10))),
                  Center(child: Text(G, style: TextStyle(fontSize: 10))),
                  Center(child: Text(G, style: TextStyle(fontSize: 10))),
                  Center(child: Text(A, style: TextStyle(fontSize: 10))),
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
                  Center(child: Text(P26, style: TextStyle(fontSize: 10))),
                  Center(child: Text(P27, style: TextStyle(fontSize: 10))),
                  Center(child: Text(P28, style: TextStyle(fontSize: 10))),
                  Center(child: Text(P29, style: TextStyle(fontSize: 10))),
                  Center(child: Text(P30, style: TextStyle(fontSize: 10))),
                ]),
                TableRow(children: [
                  Center(
                      child: Text(
                    "\nDay 4 \n",
                    style: TextStyle(fontSize: 10),
                  )),
                  Center(child: Text(P31, style: TextStyle(fontSize: 10))),
                  Center(child: Text(P32, style: TextStyle(fontSize: 10))),
                  Center(child: Text(P33, style: TextStyle(fontSize: 10))),
                  Center(child: Text(P34, style: TextStyle(fontSize: 10))),
                  Center(child: Text(P35, style: TextStyle(fontSize: 10))),
                  Center(child: Text(D, style: TextStyle(fontSize: 10))),
                  Center(child: Text(D, style: TextStyle(fontSize: 10))),
                  Center(child: Text(B, style: TextStyle(fontSize: 10))),
                  Center(child: Text(C, style: TextStyle(fontSize: 10))),
                  Center(child: Text(G, style: TextStyle(fontSize: 10))),
                ]),
                TableRow(children: [
                  Center(
                      child: Text(
                    "\nDay 5 \n",
                    style: TextStyle(fontSize: 10),
                  )),
                  Center(child: Text(E, style: TextStyle(fontSize: 10))),
                  Center(child: Text(E, style: TextStyle(fontSize: 10))),
                  Center(child: Text(A, style: TextStyle(fontSize: 10))),
                  Center(child: Text(B, style: TextStyle(fontSize: 10))),
                  Center(child: Text(C, style: TextStyle(fontSize: 10))),
                  
                  Center(child: Text(P46, style: TextStyle(fontSize: 10))),
                  Center(child: Text(P47, style: TextStyle(fontSize: 10))),
                  Center(child: Text(P48, style: TextStyle(fontSize: 10))),
                  Center(child: Text(P49, style: TextStyle(fontSize: 10))),
                  Center(child: Text(P50, style: TextStyle(fontSize: 10))),
                ]),
              ]),
        ],
      )),
    );
  }
}
MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
  keywords: <String>['games', 'beautiful apps'],
  contentUrl: 'https://flutter.io',
  birthday: DateTime.now(),
  childDirected: false,
  designedForFamilies: false,
  
  gender:
      MobileAdGender.male, // or MobileAdGender.female, MobileAdGender.unknown
  testDevices: ["F80F5F49B900622047C7F39485FA5449"], // Android emulators are considered test devices
);

BannerAd myBanner = BannerAd(
  // Replace the testAdUnitId with an ad unit id from the AdMob dash.
  // https://developers.google.com/admob/android/test-ads
  // https://developers.google.com/admob/ios/test-ads
  adUnitId: "ca-app-pub-8068139846844354/9655184581",
  size: AdSize.smartBanner,
  targetingInfo: targetingInfo,
  
  listener: (MobileAdEvent event) {
    print("BannerAd event is $event");
  },
);
