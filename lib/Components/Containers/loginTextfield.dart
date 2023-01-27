import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:twoduo/Components/Helpers/Constants.dart';
import 'package:twoduo/Components/Helpers/ValidationClass.dart';
import 'package:twoduo/Controllers.dart/LoginController.dart';

import '../Helpers/dimensions.dart';

class Logintextfiled extends StatelessWidget {
  final TextEditingController Controller;
  final String hinttext;
  final String label;
  final Function onchanged;
  final Function onsaved;
  IconData Suffixicon;
  Logintextfiled(
      {required this.Controller,
      required this.hinttext,
      this.Suffixicon = Icons.clear,
      required this.label,
      required this.onchanged,
      required this.onsaved});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (controller) {
      return TextFormField(
        keyboardType: TextInputType.text,
        controller: Controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: TextStyle(
          color: Colors.grey,
        ),
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () => Controller.clear(),
            icon: Icon(Suffixicon, color: Colors.orange),
          ),
          hintText: hinttext,
          label: Text(
            label,
            style: TextStyle(color: Constants.mainColor),
          ),
          hintStyle: TextStyle(color: Colors.grey.shade500),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.height25),
              borderSide: BorderSide(color: Constants.mainColor)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.height25),
            borderSide: BorderSide(color: Colors.lightBlueAccent),
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.height25),
              borderSide: BorderSide(color: Colors.pinkAccent)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.height25),
              borderSide: BorderSide(color: Colors.lightBlueAccent)),
        ),
        onChanged: (value) => onchanged(value),
        onSaved: (value) => onsaved(value),
        validator: (value) {
          if (validationhelper.EmailValidation(value!) != "error") {
            return validationhelper.EmailValidation(value);
          }
        },
      );
    });
  }
}
