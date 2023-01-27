import 'package:flutter/material.dart';
import '../Helpers/Constants.dart';
import '../Helpers/dimensions.dart';

class AddTaskButton extends StatelessWidget {
  var height = Dimensions.height30 + Dimensions.height5;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height50,
      width: double.maxFinite,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(Dimensions.height15)),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: height,
              width: height,
              decoration: BoxDecoration(
                  color: Constants.mainColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular((height) / 2)),
              child: Center(
                child: Icon(
                  Icons.add,
                  color: Constants.mainColor,
                ),
              ),
            ),
            SizedBox(
              width: Dimensions.width10,
            ),
            Text("Add Task",
                style: TextStyle(
                    color: Constants.mainColor,
                    fontSize: Dimensions.height30,
                    fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}
