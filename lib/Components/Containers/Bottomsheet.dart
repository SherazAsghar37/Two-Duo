import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:twoduo/Components/Containers/textFieldContainer.dart';
import 'package:get/get.dart';
import 'package:twoduo/Components/Helpers/DataSender.dart';
import 'package:twoduo/Components/Helpers/GetColor.dart';
import 'package:twoduo/Controllers.dart/taskcontroller.dart';
import '../Helpers/Constants.dart';
import '../Helpers/dimensions.dart';
import '../Text/BigFont.dart';
import 'RemindmeRow.dart';
import 'TagContainer.dart';
import 'addTaskButton.dart';

class Bottomsheet extends StatelessWidget {
  TaskController taskController = Get.find();
  var height = Dimensions.height30 + Dimensions.height5;
  final firebase = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaskController>(builder: (controller) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigFont(text: "Add Task", color: Colors.white),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  TextFieldContainer(
                    onchanged: (value) {
                      controller.Title = value;
                    },
                    onsaved: (value) {
                      controller.Title = value;
                    },
                    ontap: () {},
                    label: "Title",
                    Controller: controller.TitleController,
                    hinttext: "Task Title",
                  ),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  TextFieldContainer(
                    onchanged: (value) {
                      controller.Description = value;
                    },
                    onsaved: (value) {
                      controller.Description = value;
                    },
                    ontap: () {},
                    label: "Description",
                    Controller: controller.DescriptionController,
                    hinttext: "Describe your task",
                  ),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  TextFieldContainer(
                    readonly: true,
                    onchanged: (value) {
                      controller.Date = controller.DateController.text;
                    },
                    onsaved: (value) {
                      controller.Date = controller.DateController.text;
                    },
                    Suffixicon: Icons.calendar_month,
                    ontap: () async {
                      DateTime? picDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2022),
                          lastDate: DateTime(2100));
                      picDate != null
                          ? {
                              controller.DateController.text =
                                  DateFormat('yyyy-MM-dd').format(picDate),
                              controller.Date =
                                  DateFormat('yyyy-MM-dd').format(picDate)
                            }
                          : {};
                    },
                    label: "Date",
                    Controller: controller.DateController,
                    hinttext: "Task starting Date",
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  TextFieldContainer(
                    onchanged: (value) {
                      controller.Time = controller.TimeController.text;
                    },
                    onsaved: (value) {
                      controller.Time = controller.TimeController.text;
                    },
                    readonly: true,
                    ontap: () async {
                      TimeOfDay? pickTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                        initialEntryMode: TimePickerEntryMode.input,
                      );
                      pickTime != null
                          ? {
                              controller.TimeController.text = pickTime
                                  .replacing(
                                      hour: pickTime.hourOfPeriod,
                                      minute: pickTime.minute)
                                  .toString(),
                              controller.Time = TimeOfDay(
                                      hour: pickTime.hour,
                                      minute: pickTime.minute)
                                  .format(context)
                                  .toString()
                            }
                          : {};
                    },
                    label: "Time",
                    Controller: controller.TimeController,
                    hinttext: "Enter Starting Time",
                  ),
                  SizedBox(
                    height: Dimensions.height15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              backgroundColor: Colors.grey.withOpacity(0.2),
                              isScrollControlled: true,
                              context: context,
                              builder: ((context) {
                                return Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: Dimensions.height30,
                                      horizontal: Dimensions.width20),
                                  height: (Dimensions.Screenheight / 2.2),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(
                                            Dimensions.height20),
                                        topRight: Radius.circular(
                                            Dimensions.height20)),
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        children:
                                            getColor(height: height).FirstRow(),
                                      ),
                                      SizedBox(
                                        height: Dimensions.height5,
                                      ),
                                      Row(
                                        children: getColor(height: height)
                                            .secondRow(),
                                      ),
                                      SizedBox(
                                        height: Dimensions.height5,
                                      ),
                                      Row(
                                        children:
                                            getColor(height: height).ThirdRow(),
                                      ),
                                      SizedBox(
                                        height: Dimensions.height5,
                                      ),
                                      Row(
                                        children: getColor(height: height)
                                            .FourthRow(),
                                      ),
                                      SizedBox(
                                        height: Dimensions.height5,
                                      ),
                                      Row(
                                        children:
                                            getColor(height: height).FifthRow(),
                                      ),
                                      SizedBox(
                                        height: Dimensions.height5,
                                      ),
                                      Row(
                                        children:
                                            getColor(height: height).sixthRow(),
                                      ),
                                    ],
                                  ),
                                );
                              }));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: Dimensions.height5,
                              horizontal: Dimensions.width10),
                          height: height + Dimensions.height10,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.5),
                              borderRadius:
                                  BorderRadius.circular(Dimensions.height30)),
                          child: Row(
                            children: [
                              Container(
                                height: height,
                                width: height,
                                decoration: BoxDecoration(
                                    color: Constants.mainColor.withOpacity(0.5),
                                    borderRadius:
                                        BorderRadius.circular((height) / 2)),
                                child: Center(
                                  child: Icon(Icons.add, color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                width: Dimensions.width5,
                              ),
                              Text(
                                "Relevant Tag",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: Dimensions.height20),
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: TagContainer(
                          height: height,
                          Link: "BottomSheet",
                          lightColor: Colors.lightGreen,
                          darkColor: Colors.green.shade700,
                          Tag: taskController.Tag,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Dimensions.height15,
                  ),
                  RemindmeRow(),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  GestureDetector(
                      onTap: () {
                        DataSender().SendingHelper(context);
                      },
                      child: AddTaskButton()),
                  SizedBox(
                    height: Dimensions.height100 * 3,
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
