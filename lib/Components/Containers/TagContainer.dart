import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twoduo/Controllers.dart/taskcontroller.dart';
import '../Helpers/dimensions.dart';

class TagContainer extends StatelessWidget {
  final double height;
  final Color lightColor;
  final Color darkColor;
  final String Tag;
  final String Link;
  TagContainer(
      {required this.height,
      required this.lightColor,
      required this.darkColor,
      required this.Tag,
      this.Link = 'BottomSheet'});
  TaskController taskController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaskController>(builder: (controller) {
      return GestureDetector(
        onTap: () {
          controller.SetTag(Tag);
          if (Link == 'BottomSheet') {
            Navigator.pop(context);
          }
        },
        child: Container(
          height: height + Dimensions.height10,
          margin: EdgeInsets.symmetric(horizontal: Dimensions.width5),
          padding: EdgeInsets.symmetric(
              vertical: Dimensions.height10, horizontal: Dimensions.width10),
          decoration: BoxDecoration(
            color: lightColor.withOpacity(0.4),
            borderRadius: BorderRadius.circular(Dimensions.height30),
          ),
          child: Text(
            Tag,
            style: TextStyle(color: darkColor, fontSize: Dimensions.height20),
          ),
        ),
      );
    });
  }
}
