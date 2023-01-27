import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twoduo/Controllers.dart/Comparison.dart';
import 'package:twoduo/Components/Helpers/Constants.dart';
import 'package:twoduo/Controllers.dart/taskcontroller.dart';
import 'package:twoduo/pages/mainHomePage.dart';

class DataSender {
  TaskController controller = Get.find();
  DateComparision datecontroller = Get.find();
  final firebase = FirebaseFirestore.instance;
  void SendingHelper(context) {
    if (controller.Date != '' &&
        controller.Time != '' &&
        controller.Title != '' &&
        controller.Description != '') {
      firebase.collection('Tasks').add({
        "Title": controller.Title,
        "Description": controller.Description,
        "Time": controller.Time,
        "Date": controller.Date,
        "remindme": controller.SwitchState,
        'Tag': controller.Tag,
        'complition': false
      });
      controller.TimeController.clear();
      controller.DescriptionController.clear();
      controller.TitleController.clear();
      controller.DateController.clear();
      controller.Date = '';
      controller.Time = '';
      controller.Title = '';
      controller.Description = '';
      controller.Tag = 'Notification';
      datecontroller.removeCalled = false;
      if (controller.SwitchState == true) {
        controller.SwitchStateChanger(false);
      }
      MyHomePage();
      Navigator.pop(context);
    } else {
      Get.snackbar("Empty Field", "Field cannot be Empty",
          colorText: Colors.white,
          backgroundColor: Constants.mainColor.withOpacity(0.2));
    }
  }
}
