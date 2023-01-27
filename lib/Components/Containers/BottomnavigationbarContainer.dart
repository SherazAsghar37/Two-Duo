import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twoduo/Components/Containers/Bottomsheet.dart';
import 'package:twoduo/Controllers.dart/Comparison.dart';
import 'package:twoduo/Components/Helpers/Constants.dart';
import 'package:twoduo/Controllers.dart/taskcontroller.dart';
import '../Helpers/dimensions.dart';

class Bottomnavigationbar extends StatelessWidget {
  TaskController taskController = Get.find();
  // final String Date;
  // final String Time;
  // Bottomnavigationbar({required this.Date, required this.Time});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaskController>(builder: (controller) {
      return Container(
        height: Dimensions.height50 + Dimensions.height10,
        decoration: BoxDecoration(
            gradient: Constants.primaryGradient,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.height20),
                topRight: Radius.circular(Dimensions.height20)),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, -5),
                  color: Constants.ShadowColor,
                  blurRadius: Dimensions.height5)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Add New",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: Dimensions.height20,
                  fontWeight: FontWeight.bold),
            ),
            FloatingActionButton(
              shape: CircleBorder(),
              backgroundColor: Colors.white,
              elevation: Dimensions.height10,
              splashColor: Constants.mainColor,
              onPressed: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.grey.shade500,
                    context: context,
                    builder: ((context) {
                      return Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.width20,
                              vertical: Dimensions.height20),
                          decoration: BoxDecoration(
                            gradient: Constants.primaryGradient,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(Dimensions.height20),
                                topRight: Radius.circular(Dimensions.height20)),
                          ),
                          height:
                              Dimensions.Screenheight - Dimensions.height110,
                          child: Bottomsheet());
                    }));
              },
              child: Icon(
                Icons.add,
                color: Constants.mainColor,
              ),
            ),
            Text(
              "Task Here",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: Dimensions.height20,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
    });
  }
}