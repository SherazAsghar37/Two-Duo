import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twoduo/Components/Helpers/Constants.dart';
import 'package:twoduo/pages/mainHomePage.dart';
import 'Dependencies/Dependencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: dep.initdep(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshots) {
            try {
              if (snapshots == null) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Constants.mainColor,
                  ),
                );
              } else {
                return MyHomePage();
              }
            } catch (e) {
              return Text(e.toString());
            }
          }),
    );
  }
}
