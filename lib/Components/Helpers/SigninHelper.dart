import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:twoduo/pages/LoginPage.dart';

class SigninHelper {
  static SigninWithGoogle(context) async {
    GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
    GoogleSignInAuthentication userAuth = await userAccount!.authentication;
    AuthCredential authCredential = GoogleAuthProvider.credential(
        idToken: userAuth.idToken, accessToken: userAuth.accessToken);
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(authCredential);
  }

  static GoogleSignout(context) async {
    await GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
  }
}
