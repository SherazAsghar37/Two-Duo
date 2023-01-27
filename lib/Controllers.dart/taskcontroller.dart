import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:twoduo/Components/Helpers/TasksClass.dart';

class TaskController extends GetxController {
  String _Task = '';
  List<dynamic> FakeTaskList = [
    Tasks(
        Task: "Wakeup early and pray fajar.",
        state: false,
        Tags: 'clock',
        description: "Wake up and take bath and go to pray fajar."),
    Tasks(
        Task: "Eat breakfast and Code.",
        state: false,
        Tags: "eat",
        description:
            "Eat breakfast and code your new app and add new page view builder and add images in background and texts."),
    Tasks(
        Task: "Pray Zohar and take a Bath.",
        state: false,
        Tags: "time",
        description: "Pray Zohar and spend some time without screen."),
    Tasks(
        Task: "Go to shopping. ",
        state: false,
        Tags: "shopping",
        description: "Go to zainab market to buy some clothes."),
    Tasks(
        Task: "Start to Code ",
        state: false,
        Tags: "study",
        description: "resume Your Code"),
    Tasks(
        Task: "Play Some Game",
        state: false,
        Tags: "sports",
        description: "Go and Play Cricket")
  ];
  RxBool? _state = false.obs;
  bool? get state => _state!.value;

  void setState(bool? newvalue, int Index) {
    FakeTaskList[Index].state = newvalue;
    update();
  }

  // String iconsReturner(int index) {
  //   if (FakeTaskList[index].Tags.contains("person")) {
  //     return "images/person.png";
  //   } else if (FakeTaskList[index].Tags.contains("clock")) {
  //     return 'images/clock.png';
  //   } else if (FakeTaskList[index].Tags.contains("shopping")) {
  //     return 'images/shopping.png';
  //   } else if (FakeTaskList[index].Tags.contains("eat")) {
  //     return 'images/eat.png';
  //   } else if (FakeTaskList[index].Tags.contains("idea")) {
  //     return 'images/idea.png';
  //   } else if (FakeTaskList[index].Tags.contains("notification")) {
  //     return 'images/bell.png';
  //   } else if (FakeTaskList[index].Tags.contains("direction")) {
  //     return 'images/direction.png';
  //   } else if (FakeTaskList[index].Tags.contains("location")) {
  //     return 'images/location.png';
  //   } else if (FakeTaskList[index].Tags.contains("message")) {
  //     return 'images/message.png';
  //   } else if (FakeTaskList[index].Tags.contains("money")) {
  //     return 'images/money.png';
  //   } else if (FakeTaskList[index].Tags.contains("music")) {
  //     return 'images/music.png';
  //   } else if (FakeTaskList[index].Tags.contains("photo")) {
  //     return 'images/photo.png';
  //   } else if (FakeTaskList[index].Tags.contains("protection")) {
  //     return 'images/protection.png';
  //   } else if (FakeTaskList[index].Tags.contains("settings")) {
  //     return 'images/settings.png';
  //   } else if (FakeTaskList[index].Tags.contains("video")) {
  //     return 'images/video.png';
  //   } else if (FakeTaskList[index].Tags.contains("wallet")) {
  //     return 'images/wallet.png';
  //   } else if (FakeTaskList[index].Tags.contains("study")) {
  //     return 'images/study.png';
  //   } else if (FakeTaskList[index].Tags.contains("health")) {
  //     return 'images/health.png';
  //   } else if (FakeTaskList[index].Tags.contains("love")) {
  //     return 'images/love.png';
  //   } else if (FakeTaskList[index].Tags.contains("sports")) {
  //     return 'images/sports.png';
  //   }
  //   return 'images/bell.png';
  // }

  List<String> Icons = [
    'person',
    'clock',
    'shopping',
    'eat',
    'idea',
    'notification',
    'direction',
    'location',
    'message',
    'money',
    'music',
    'photo',
    'protection',
    'settings',
    'video',
    'wallet',
    'study',
    'health',
    'love',
    'sports'
  ];
  TextEditingController TitleController = TextEditingController();
  String Title = '';
  TextEditingController DescriptionController = TextEditingController();
  String Description = '';
  TextEditingController DateController = TextEditingController();
  String Date = '';
  TextEditingController TimeController = TextEditingController();
  String Time = '';
  String Tag = 'Notification';
  void SetTag(String NewTag) {
    Tag = NewTag;
    update();
  }

  bool SwitchState = false;
  void SwitchStateChanger(bool value) {
    SwitchState = value;
    update();
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  SigninWithGoogle(context) async {
    GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
    GoogleSignInAuthentication userAuth = await userAccount!.authentication;
    AuthCredential authCredential = GoogleAuthProvider.credential(
        idToken: userAuth.idToken, accessToken: userAuth.accessToken);
    UserCredential userCredential =
        await auth.signInWithCredential(authCredential);
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
