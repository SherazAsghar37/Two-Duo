import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SigninHelper {
  static SigninWithGoogle() async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication userAuth = await googleUser!.authentication;
    AuthCredential authCredential = await GoogleAuthProvider.credential(
        accessToken: userAuth.accessToken, idToken: userAuth.idToken);
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(authCredential);
  }
}
