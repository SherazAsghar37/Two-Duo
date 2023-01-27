import 'package:get/get.dart';
import 'package:twoduo/Controllers.dart/Comparison.dart';
import 'package:twoduo/Controllers.dart/LoginController.dart';
import 'package:twoduo/Controllers.dart/taskcontroller.dart';

class initdep extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TaskController());
    Get.lazyPut(() => DateComparision());
    Get.lazyPut(() => LoginController());
  }
}
