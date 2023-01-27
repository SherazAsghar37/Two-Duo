import 'package:flutter/material.dart';
import 'package:twoduo/Controllers.dart/taskcontroller.dart';
import 'package:get/get.dart';
import '../Helpers/dimensions.dart';

class iconAignment extends StatelessWidget {
  final int Index;
  final String icon;
  iconAignment({required this.Index, required this.icon});
  TaskController taskController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -20,
      left: 0,
      child: Container(
        height: Dimensions.height100 * 1.2,
        width: Dimensions.width120,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 20),
                  blurRadius: Dimensions.height20,
                  spreadRadius: -Dimensions.height50,
                  color: Colors.grey.shade800),
            ],
            image: DecorationImage(
                image: AssetImage('images/${icon}.png'), fit: BoxFit.contain)),
      ),
    );
  }
}
