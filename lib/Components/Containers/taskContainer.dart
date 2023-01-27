import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:twoduo/Components/Helpers/Constants.dart';
import 'package:twoduo/Components/Helpers/TasksClass.dart';
import 'package:twoduo/Controllers.dart/taskcontroller.dart';
import '../Text/descriptionText.dart';
import 'CheckBox.dart';
import '../Text/DateText.dart';
import '../Helpers/dimensions.dart';
import 'iconAlignment.dart';
import 'package:get/get.dart';

class TaskContainer extends StatelessWidget {
  final String Title;
  final int Index;
  final String description;
  final String time;
  final String icon;
  final String date;
  CollectionReference product;
  var snapshots;

  bool complitionState;
  TaskContainer(
      {required this.product,
      required this.complitionState,
      required this.Index,
      required this.Title,
      required this.description,
      required this.date,
      required this.time,
      required this.icon,
      required this.snapshots});

  TaskController taskController = Get.find();
  Widget build(BuildContext context) {
    int picindex = Index % 5;
    return Container(
      height: Dimensions.height100 * 1.6,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.height100 * 1.2,
              width: double.maxFinite,
              padding: EdgeInsets.all(Dimensions.height15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: AssetImage('images/card${picindex}.png'),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(Dimensions.height20),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, -5),
                      color: Constants.ShadowColor,
                      blurRadius: Dimensions.height10,
                    ),
                  ]),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Title,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: Dimensions.height20,
                                fontWeight: FontWeight.w700,
                                overflow: TextOverflow.ellipsis),
                          ),
                          SizedBox(height: Dimensions.height5),
                          Container(
                            width: Dimensions.width120 * 2,
                            child: DescriptionText(
                              description: description,
                              pageNo: 0,
                            ),
                          ),
                          Row(
                            children: [
                              DateText(
                                date: time,
                              ),
                              SizedBox(
                                width: Dimensions.width5,
                              ),
                              DateText(
                                date: date,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    CheckBox(
                      complitionState: complitionState,
                      product: product,
                      snapshots: snapshots,
                      Index: Index,
                    )
                  ],
                ),
              ),
            ),
          ),
          iconAignment(
            icon: icon,
            Index: Index,
          ),
        ],
      ),
    );
  }
}
