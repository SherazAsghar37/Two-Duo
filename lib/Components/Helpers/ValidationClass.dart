import 'package:get/get.dart';

class validationhelper {
  static String ErrorReturner(String value, String Title) {
    if (Title == 'Title') {
      if (value.length > 30) {
        return "Title is too large";
      }
    }
    return "";
  }

  static String EmailValidation(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Invalid Email";
    }
    return "error";
  }
}
