import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:twoduo/Controllers.dart/Comparison.dart';
import 'package:twoduo/Components/Helpers/Constants.dart';
import 'package:twoduo/Controllers.dart/taskcontroller.dart';
import 'package:get/get.dart';

class CheckBox extends StatelessWidget {
  final int Index;
  final Color color;
  bool complitionState;
  CollectionReference product;
  var snapshots;
  CheckBox(
      {required this.complitionState,
      required this.snapshots,
      required this.Index,
      this.color = Colors.white,
      required this.product});
  Future<void> _deleteProduct(String productId) async {
    await product.doc(productId).delete();
  }

  Future<void> updateproduct(String productId, value) async {
    await product.doc(productId).update({'complition': value});
  }

  @override
  Widget build(BuildContext context) {
    TaskController taskController = Get.find();
    return GetBuilder<DateComparision>(builder: (controller) {
      return Theme(
          data: ThemeData(
              unselectedWidgetColor: color == null ? Colors.white : color),
          child: Checkbox(
            value: complitionState,
            shape: CircleBorder(),
            onChanged: ((value) async {
              await updateproduct(snapshots, value);
              controller.remover(snapshots);
              _deleteProduct(snapshots);
            }),
            checkColor: Colors.orange,
            focusColor: Colors.white,
            activeColor: Colors.white,
          ));
    });
  }
}
