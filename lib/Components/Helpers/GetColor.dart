import 'package:flutter/material.dart';

import '../Containers/TagContainer.dart';

class getColor {
  final double height;
  getColor({required this.height});
  Color GetLightColor(int counter) {
    int check = counter % 3;
    if (check == 0) {
      return Colors.lightGreen;
    } else if (check == 1) {
      return Colors.lightBlueAccent;
    } else if (check == 2) {
      return Colors.pinkAccent;
    }
    return Colors.lightGreen;
  }

  Color GetDarkColor(int counter) {
    int check = counter % 3;
    if (check == 0) {
      return Colors.green.shade700;
    } else if (check == 1) {
      return Colors.blue.shade700;
    } else if (check == 2) {
      return Colors.red.shade700;
    }
    return Colors.green.shade700;
  }

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

  List<Widget> ReturnTags() {
    List<Widget> TempList = [];
    List<Widget> widgetsList = [];
    for (int i = 0; i < Icons.length; i++) {
      int check = i % 4;
      Widget addThis = TagContainer(
        height: height,
        lightColor: GetLightColor(i),
        darkColor: GetDarkColor(i),
        Tag: Icons[i].toString(),
      );
      TempList.add(addThis);
    }
    return TempList;
  }

  List<Widget> FirstRow() {
    List<Widget> firstRow = [];
    for (int i = 0; i < ReturnTags().length; i++) {
      firstRow.add(ReturnTags()[i]);
      if (i == 3) {
        return firstRow;
      }
    }
    return firstRow;
  }

  List<Widget> secondRow() {
    List<Widget> firstRow = [];
    for (int i = 4; i < ReturnTags().length; i++) {
      firstRow.add(ReturnTags()[i]);
      if (i == 6) {
        return firstRow;
      }
    }
    return firstRow;
  }

  List<Widget> ThirdRow() {
    List<Widget> firstRow = [];
    for (int i = 7; i < ReturnTags().length; i++) {
      firstRow.add(ReturnTags()[i]);
      if (i == 9) {
        return firstRow;
      }
    }
    return firstRow;
  }

  List<Widget> FourthRow() {
    List<Widget> firstRow = [];
    for (int i = 10; i < ReturnTags().length; i++) {
      firstRow.add(ReturnTags()[i]);
      if (i == 12) {
        return firstRow;
      }
    }
    return firstRow;
  }

  List<Widget> FifthRow() {
    List<Widget> firstRow = [];
    for (int i = 13; i < ReturnTags().length; i++) {
      firstRow.add(ReturnTags()[i]);
      if (i == 16) {
        return firstRow;
      }
    }
    return firstRow;
  }

  List<Widget> sixthRow() {
    List<Widget> firstRow = [];
    for (int i = 17; i < ReturnTags().length; i++) {
      firstRow.add(ReturnTags()[i]);
      if (i == 20) {
        return firstRow;
      }
    }
    return firstRow;
  }
}
