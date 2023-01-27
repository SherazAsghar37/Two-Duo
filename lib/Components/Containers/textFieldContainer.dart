import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:twoduo/Components/Helpers/ValidationClass.dart';
import 'package:twoduo/Controllers.dart/taskcontroller.dart';

import '../Helpers/dimensions.dart';

class TextFieldContainer extends StatelessWidget {
  final TextEditingController Controller;
  final bool readonly;
  final String hinttext;
  final Function ontap;
  final String label;
  final Function onchanged;
  final Function onsaved;
  IconData Suffixicon;
  TextFieldContainer(
      {required this.Controller,
      this.readonly = false,
      required this.hinttext,
      this.Suffixicon = Icons.clear,
      required this.label,
      required this.ontap,
      required this.onchanged,
      required this.onsaved});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaskController>(builder: (controller) {
      return Theme(
        data: ThemeData().copyWith(
            colorScheme: ThemeData().colorScheme.copyWith(
                  primary: Colors.deepOrange,
                )),
        child: TextFormField(
          readOnly: readonly == null ? false : readonly,
          keyboardType: TextInputType.text,
          controller: Controller,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style: TextStyle(
              color: Colors.white,
              fontSize: Dimensions.height20,
              fontWeight: FontWeight.bold),
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () => Controller.clear(),
              icon: Icon(Suffixicon, color: Colors.white),
            ),
            hintText: hinttext,
            label: Text(
              label,
              style: TextStyle(color: Colors.white),
            ),
            hintStyle: TextStyle(color: Colors.grey.withOpacity(0.4)),
          ),
          onTap: (() => ontap()),
          onChanged: (value) => onchanged(value),
          onSaved: (value) => onsaved(value),
          validator: (value) => validationhelper.ErrorReturner(value!, label),
        ),
      );
    });
  }
}
