import 'package:flutter/material.dart';
import '../Helpers/dimensions.dart';

class BigFont extends StatelessWidget {
  final String text;
  final Color color;
  BigFont({required this.text, this.color = Colors.black});
  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            color: color == null ? Colors.black : color,
            fontSize: Dimensions.height30,
            fontWeight: FontWeight.w800));
  }
}
