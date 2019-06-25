import 'package:flutter/material.dart';
import 'login.dart';
import 'root.dart';
import 'home.dart';
import 'auth.dart';

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
      ),
      home: RootPage(auth: new Auth()),
      routes: <String, WidgetBuilder>{
        // '/landingpage': (BuildContext context) => new MyApp(),
        '/login': (BuildContext context) => new Login(),
        '/home': (BuildContext context) => new Home(),
        '/root': (BuildContext context) => new MyApp(),
      },
    );
  }
}
