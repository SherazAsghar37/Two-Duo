import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twoduo/Controllers.dart/taskcontroller.dart';
import '../Helpers/dimensions.dart';
import 'SliderContainer.dart';

class RemindmeRow extends StatelessWidget {
  const RemindmeRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaskController>(builder: (SwitchController) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: Dimensions.height50 + Dimensions.height10,
                width: Dimensions.height50 + Dimensions.height10,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 247, 131, 64).withOpacity(0.3),
                  borderRadius: BorderRadius.circular(Dimensions.height20),
                ),
                child: Icon(
                  SwitchController.SwitchState == false
                      ? Icons.notifications
                      : Icons.notifications_active,
                  color: Color.fromARGB(255, 240, 104, 0),
                  size: Dimensions.height45,
                ),
              ),
              SizedBox(
                width: Dimensions.width10,
              ),
              Text("Remind Me",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Dimensions.height22,
                  ))
            ],
          ),
          sliderContainer(),
        ],
      );
    });
  }
}
