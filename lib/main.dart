import 'package:flutter/material.dart';
import 'package:mytools_flutter/timetableInput.dart';
import 'package:mytools_flutter/timetableInputTwo.dart';
import 'login.dart';
import 'root.dart';
import 'home.dart';
import 'auth.dart';
import 'timetable.dart';
import 'profile.dart';
import 'profileTwo.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      home: RootPage(auth: new Auth()),
      routes: <String, WidgetBuilder>{
        // '/landingpage': (BuildContext context) => new MyApp(),
        '/login': (BuildContext context) => new Login(),
        '/home': (BuildContext context) => new Home(),
        '/root': (BuildContext context) => new MyApp(),
        '/timetable': (BuildContext context) => new Timetable(),
        '/profile': (BuildContext context) => new Profile(),
        '/profileTwo': (BuildContext context) => new ProfileTwo(),
        '/timetable': (BuildContext context) => new Timetable(),
        '/timetableInput': (BuildContext context) => new TimetableInput(),
        '/timetableInputTwo': (BuildContext context) => new TimetableInputTwo(),
      },
    );
  }
}
