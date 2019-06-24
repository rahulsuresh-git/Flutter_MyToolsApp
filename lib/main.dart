import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'home.dart';
import 'login.dart';
import 'auth.dart';

Widget defaultHome = new Login();
bool isLoggedIn = false;

void main() {
  FirebaseAuth.instance.currentUser().then((user) {
    print(user.email);
    if (user.email != null) {
      isLoggedIn = false;
      defaultHome = Home(
        isLoggedIn: isLoggedIn,
      );
    } else {
      isLoggedIn = true;
      defaultHome = Login(
        isLoggedIn: isLoggedIn,
      );
    }
  });

  runApp(new MyApp());
}

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   Auth auth = new Auth();

//   // void initState() {
// // FirebaseAuth.instance.currentUser().then((user) {
//   //   print("hi" + user.uid);
//   // });
//   // widget.auth.currentUser().then((user) {
//   //   print(user);
//   //   setState(() {
//   //     authStatus =
//   //         user == null ? AuthStatus.notSignedIn : AuthStatus.signedIn;
//   //   });
//   // });
//   // }

//   checkLogin(BuildContext context) {
//     // if (authStatus == AuthStatus.signedIn) {
//     //   return Home();
//     // } else {
//     //   return Login();
//     // }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'MyTools v5.0',
//       debugShowCheckedModeBanner: false,
//       home: checkLogin(context),
//     );
//   }
// }

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "MyTools 5.0",
        debugShowCheckedModeBanner: false,
        home: _defaultHome);
  }
}
