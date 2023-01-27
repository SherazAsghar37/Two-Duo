import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:twoduo/Components/Containers/CheckBox.dart';
import 'package:twoduo/Components/Helpers/dimensions.dart';
import 'package:get/get.dart';
import 'package:twoduo/Components/Text/DateText.dart';
import 'package:twoduo/Components/Text/descriptionText.dart';
import 'package:twoduo/Controllers.dart/taskcontroller.dart';

import '../Helpers/Constants.dart';

class pageContainer extends StatelessWidget {
  final int position;
  final String Title;
  final String description;
  CollectionReference product;
  var snapshot;

  bool complitionState;
  pageContainer(
      {required this.product,
      required this.complitionState,
      required this.position,
      required this.snapshot,
      required this.Title,
      required this.description});
  TaskController taskController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
          Dimensions.width10, Dimensions.height10, Dimensions.width10, 0),
      margin: EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 5,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage('images/page${position}.png'),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(Dimensions.height20),
          boxShadow: [
            BoxShadow(
              offset: Offset(-5, 5),
              color: Constants.ShadowColor,
              blurRadius: 10,
            ),
            BoxShadow(
              offset: Offset(5, 0),
              color: Constants.ShadowColor,
              blurRadius: 10,
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                Title,
                style: TextStyle(
                    color: Constants.mainColor,
                    fontSize: Dimensions.height17,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: Dimensions.height5,
              ),
              DescriptionText(
                description: description,
                pageNo: 1,
                color: Colors.grey.shade500,
              ),
              SizedBox(height: Dimensions.height5),
              DateText(
                color: Colors.black,
                date: "",
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CheckBox(
                complitionState: complitionState,
                product: product,
                snapshots: snapshot,
                Index: position,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
