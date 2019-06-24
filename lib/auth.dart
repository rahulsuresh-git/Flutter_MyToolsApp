import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn();

  Future<String> signInWithGoogle(GoogleSignInAuthentication gsa) async {
    FirebaseUser user = await _auth.signInWithGoogle(
        idToken: gsa.idToken, accessToken: gsa.accessToken);
    return user.uid;
  }

  Future<FirebaseUser> currentUser() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    return user;
  }

  Future<void> signOut() async {
    return FirebaseAuth.instance.signOut();
  }
}
