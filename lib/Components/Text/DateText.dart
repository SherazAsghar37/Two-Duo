import 'package:flutter/material.dart';
import 'package:twoduo/Components/Helpers/dimensions.dart';

class DateText extends StatelessWidget {
  final Color color;
  final String date;
  DateText({this.color = Colors.white, required this.date});
  @override
  Widget build(BuildContext context) {
    return Text(date,
        style: TextStyle(
            color: color == null ? Colors.white : color,
            fontSize: Dimensions.height15,
            fontWeight: FontWeight.w500));
  }
}
