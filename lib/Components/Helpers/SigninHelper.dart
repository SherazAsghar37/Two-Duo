import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:twoduo/pages/LoginPage.dart';

class SigninHelper {
  FirebaseAuth auth = FirebaseAuth.instance;
  SigninWithGoogle(context) async {
    GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
    if (userAccount != null) {
      GoogleSignInAuthentication userAuth = await userAccount.authentication;
      AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: userAuth.idToken, accessToken: userAuth.accessToken);
      UserCredential userCredential =
          await auth.signInWithCredential(authCredential);
    }
  }

  GoogleSignout(context) async {
    try {
      await GoogleSignIn().signOut();
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
