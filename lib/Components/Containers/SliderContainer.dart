import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

import '../../Controllers.dart/taskcontroller.dart';
import '../Helpers/dimensions.dart';

class sliderContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaskController>(builder: (SwitchController) {
      return FlutterSwitch(
        activeSwitchBorder: Border.all(color: Colors.white),
        height: Dimensions.height30 + Dimensions.height10,
        width: Dimensions.width50 + Dimensions.width20,
        inactiveColor: Colors.grey.withOpacity(0.5),
        activeColor: Color.fromRGBO(231, 97, 2, 1).withOpacity(0.5),
        value: SwitchController.SwitchState,
        onToggle: (value) {
          SwitchController.SwitchStateChanger(value);
        },
      );
    });
  }
}
