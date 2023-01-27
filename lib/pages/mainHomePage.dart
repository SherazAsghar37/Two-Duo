import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:twoduo/Controllers.dart/Comparison.dart';
import 'package:twoduo/Components/Helpers/Constants.dart';
import 'package:twoduo/Components/Helpers/dimensions.dart';
import 'package:twoduo/Components/Containers/taskContainer.dart';
import 'package:twoduo/Controllers.dart/taskcontroller.dart';
import 'package:get/get.dart';
import '../Components/Containers/BottomnavigationbarContainer.dart';
import '../Components/Containers/MainPictureContainer.dart';
import '../Components/Containers/pageContainer.dart';
import '../Components/Text/BigFont.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  final firebase = FirebaseFirestore.instance;

  TaskController taskController = Get.find();
  final CollectionReference _productss =
      FirebaseFirestore.instance.collection('Tasks');
  PageController controller = PageController(viewportFraction: 0.45);
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<DateComparision>(builder: (DateComparisionController) {
          return Column(
            children: [
              MainPictureContainer(),
              SizedBox(height: Dimensions.height5),
              StreamBuilder<QuerySnapshot>(
                  stream:
                      firebase.collection('Tasks').orderBy("Time").snapshots(),
                  builder: ((context, snapshot) {
                    if (snapshot.hasData) {
                      return Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.width20),
                          color: Colors.white,
                          child: ListView.builder(
                              itemCount: snapshot.data!.docs.length + 2,
                              itemBuilder: ((context, index) {
                                return index < snapshot.data!.docs.length
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          index == 0
                                              ? BigFont(text: "Today")
                                              : DateComparisionController
                                                          .DateChecker(
                                                              index,
                                                              snapshot
                                                                  .data!
                                                                  .docs[index]
                                                                      ['Date']
                                                                  .toString(),
                                                              snapshot
                                                                  .data!
                                                                  .docs[index]
                                                                      ['Time']
                                                                  .toString(),
                                                              snapshot
                                                                  .data!
                                                                  .docs[index]
                                                                  .id) ==
                                                      'today'
                                                  ? TaskContainer(
                                                      complitionState: snapshot
                                                              .data!.docs[index]
                                                          ['complition'],
                                                      snapshots: snapshot
                                                          .data!.docs[index].id,
                                                      product: _productss,
                                                      icon: snapshot.data!
                                                          .docs[index]['Tag'],
                                                      time: snapshot.data!
                                                          .docs[index]['Time']
                                                          .toString(),
                                                      date: snapshot.data!
                                                          .docs[index]['Date']
                                                          .toString(),
                                                      description: snapshot
                                                          .data!
                                                          .docs[index]
                                                              ['Description']
                                                          .toString(),
                                                      Title: snapshot.data!
                                                          .docs[index]['Title']
                                                          .toString(),
                                                      Index: index,
                                                    )
                                                  : SizedBox(height: 0),
                                        ],
                                      )
                                    : DateComparisionController
                                                    .TomorrowIndexs.length >
                                                0 &&
                                            index == snapshot.data!.docs.length
                                        ? Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: Dimensions.height10,
                                              ),
                                              BigFont(
                                                text: "Tomorrow",
                                              ),
                                              SizedBox(
                                                height: Dimensions.height10,
                                              ),
                                              SizedBox(
                                                height:
                                                    Dimensions.height120 * 2,
                                                child: PageView.builder(
                                                    controller: controller,
                                                    padEnds: false,
                                                    itemCount:
                                                        DateComparisionController
                                                            .TomorrowIndexs
                                                            .length,
                                                    itemBuilder:
                                                        ((context, position) {
                                                      int currIndex =
                                                          DateComparisionController
                                                              .matched(
                                                                  snapshot
                                                                      .data!
                                                                      .docs
                                                                      .length,
                                                                  position,
                                                                  snapshot);
                                                      return currIndex >= 0
                                                          ? pageContainer(
                                                              date: snapshot
                                                                  .data!
                                                                  .docs[
                                                                      currIndex]
                                                                      ['Date']
                                                                  .toString(),
                                                              complitionState: snapshot
                                                                          .data!
                                                                          .docs[
                                                                      currIndex]
                                                                  [
                                                                  'complition'],
                                                              snapshot:
                                                                  DateComparisionController
                                                                          .TomorrowIndexs[
                                                                      position],
                                                              product:
                                                                  _productss,
                                                              description: snapshot
                                                                  .data!
                                                                  .docs[
                                                                      currIndex]
                                                                      [
                                                                      'Description']
                                                                  .toString(),
                                                              Title: snapshot
                                                                  .data!
                                                                  .docs[
                                                                      currIndex]
                                                                      ['Title']
                                                                  .toString(),
                                                              position:
                                                                  currIndex,
                                                            )
                                                          : SizedBox(
                                                              height: 0,
                                                              width: 0);
                                                    })),
                                              ),
                                            ],
                                          )
                                        : index ==
                                                (snapshot.data!.docs.length + 1)
                                            ? Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height: Dimensions.height10,
                                                  ),
                                                  BigFont(
                                                    text: "Yesterday",
                                                  ),
                                                  SizedBox(
                                                    height: Dimensions.height10,
                                                  ),
                                                  SizedBox(
                                                    height:
                                                        Dimensions.height120 *
                                                            2,
                                                    child: PageView.builder(
                                                        controller: controller,
                                                        padEnds: false,
                                                        itemCount:
                                                            DateComparisionController
                                                                .yesterdayIndexes
                                                                .length,
                                                        itemBuilder: ((context,
                                                            position) {
                                                          int currIndex =
                                                              DateComparisionController
                                                                  .Ymatched(
                                                                      snapshot
                                                                          .data!
                                                                          .docs
                                                                          .length,
                                                                      position,
                                                                      snapshot);
                                                          return currIndex >= 0
                                                              ? pageContainer(
                                                                  date: snapshot
                                                                      .data!
                                                                      .docs[
                                                                          currIndex]
                                                                          [
                                                                          'Date']
                                                                      .toString(),
                                                                  complitionState: snapshot
                                                                          .data!
                                                                          .docs[currIndex]
                                                                      [
                                                                      'complition'],
                                                                  snapshot: DateComparisionController
                                                                          .yesterdayIndexes[
                                                                      position],
                                                                  product:
                                                                      _productss,
                                                                  description: snapshot
                                                                      .data!
                                                                      .docs[
                                                                          currIndex]
                                                                          [
                                                                          'Description']
                                                                      .toString(),
                                                                  Title: snapshot
                                                                      .data!
                                                                      .docs[
                                                                          currIndex]
                                                                          [
                                                                          'Title']
                                                                      .toString(),
                                                                  position:
                                                                      currIndex,
                                                                )
                                                              : SizedBox(
                                                                  height: 0,
                                                                  width: 0,
                                                                );
                                                        })),
                                                  ),
                                                ],
                                              )
                                            : SizedBox(
                                                height: 0,
                                              );
                              })),
                        ),
                      );
                    } else {
                      return Expanded(
                        child: Container(
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Constants.mainColor,
                            ),
                          ),
                        ),
                      );
                    }
                  })),
            ],
          );
        }),
        bottomNavigationBar: Bottomnavigationbar());
  }
}
