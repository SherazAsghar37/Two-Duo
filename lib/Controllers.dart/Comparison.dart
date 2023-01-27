import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:twoduo/Controllers.dart/taskcontroller.dart';

import '../Components/Helpers/Constants.dart';

class DateComparision extends GetxController {
  String DateTimeRetuner(String Date, String Time) {
    var TimeSlice = Time.substring(0, 5).trim();
    var Datetime = "$Date $TimeSlice";
    if (Time.substring(0, 1) != '0' && Time.substring(0, 1) != '1') {
      Datetime = "$Date 0$TimeSlice";
    }
    var ampm = Time.substring(
      5,
    ).trim();
    var secondHalf = Time.substring(1, 5);
    String firstHalf = Time.substring(0, 2);

    if (ampm == 'PM') {
      int inthalf = 0;
      if (firstHalf.contains(':')) {
        inthalf = int.parse(firstHalf.substring(0, 1));
      } else {
        inthalf = int.parse(firstHalf);
      }
      inthalf += 12;
      var NewHour = inthalf.toString();
      Datetime = '$Date $NewHour';
    }
    return Datetime;
  }

  List TomorrowIndexs = [];
  List yesterdayIndexes = [];
  bool removeCalled = false;
  bool checkboxState = false;
  void remover(snapshot) {
    checkboxState = true;
    TomorrowIndexs.remove(snapshot);
    yesterdayIndexes.remove(snapshot);
    removeCalled = true;
    Get.snackbar("Congratulations", "Congratulations task has been completed",
        colorText: Colors.black,
        backgroundColor: Constants.mainColor.withOpacity(0.2));
    update();
  }

  int TomorrowIndexReturner(id) {
    if (TomorrowIndexs.contains(id)) {
      return TomorrowIndexs.indexOf(id);
    }
    return -1;
  }

  int yesterdayIndexReturner(id) {
    if (yesterdayIndexes.contains(id)) {
      return yesterdayIndexes.indexOf(id);
    }
    return -1;
  }

  int matched(int totalvalues, int position, snapshot) {
    for (int i = 0; i < totalvalues; i++) {
      if (snapshot.data!.docs[i].id == TomorrowIndexs[position]) {
        return i;
      }
    }
    return -1;
  }

  int Ymatched(int totalvalues, int position, snapshot) {
    for (int i = 0; i < totalvalues; i++) {
      if (snapshot.data!.docs[i].id == yesterdayIndexes[position]) {
        return i;
      }
    }
    return -1;
  }

  TaskController taskController = Get.find();
  String DateChecker(int index, String Date, String Time, String snapshot) {
    // TomorrowIndexs.clear();
    // yesterdayIndexes.clear();
    DateTime dtl1 = DateTime.parse(DateTimeRetuner(Date, Time));
    DateTime now = DateTime.now();
    var difference = DateTime(dtl1.year, dtl1.month, dtl1.day)
        .difference(DateTime(now.year, now.month, now.day))
        .inDays;
    if (difference <= -1 &&
        yesterdayIndexes.contains(snapshot) != true &&
        TomorrowIndexs.contains(snapshot) != true) {
      if (removeCalled == false) {
        yesterdayIndexes.add(snapshot);
      }
      return "yesterday";
    } else if (difference == 0) {
      return "today";
    } else if (difference == 1 &&
        TomorrowIndexs.contains(snapshot) != true &&
        yesterdayIndexes.contains(snapshot) != true) {
      if (removeCalled == false) {
        TomorrowIndexs.add(snapshot);
      }
      return "tomorrow";
    }
    return "tomorrow";
  }
}
