import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twoduo/Components/Containers/loginTextfield.dart';
import 'package:twoduo/Components/Helpers/Constants.dart';
import 'package:twoduo/Components/Helpers/SigninHelper.dart';
import 'package:twoduo/Components/Helpers/dimensions.dart';
import 'package:twoduo/Components/Text/BigFont.dart';
import 'package:twoduo/Components/Text/DateText.dart';
import 'package:twoduo/Controllers.dart/LoginController.dart';

import '../Components/Containers/GoogleIconContainer.dart';

class loginPage extends StatelessWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 0,
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.fromLTRB(Dimensions.width20,
                Dimensions.height45, Dimensions.width20, Dimensions.height50),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  image: AssetImage('images/Gradient.png'), fit: BoxFit.cover),
            ),
            height: double.maxFinite,
            width: double.maxFinite,
            child: GetBuilder<LoginController>(builder: (controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: Dimensions.height45,
                    width: Dimensions.height45,
                    decoration: BoxDecoration(
                        color: Constants.mainColor.withOpacity(0.3),
                        borderRadius:
                            BorderRadius.circular(Dimensions.height45)),
                    child: Center(
                        child: Icon(
                      Icons.clear,
                      color: Colors.white,
                    )),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      BigFont(text: "Login"),
                      SizedBox(
                        height: Dimensions.height30,
                      ),
                      Logintextfiled(
                          Controller: controller.loginMail,
                          hinttext: "sheraz@gmail.com",
                          label: "Email",
                          onchanged: (value) {},
                          onsaved: (value) {}),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      Logintextfiled(
                          Controller: controller.loginpassword,
                          hinttext: "sheraz123@",
                          label: "Password",
                          onchanged: (value) {},
                          onsaved: (value) {}),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              SigninHelper.SigninWithGoogle(context);
                            },
                            child: googleIconContainer(
                              name: 'google1.png',
                            ),
                          ),
                          SizedBox(
                            width: Dimensions.width20,
                          ),
                          googleIconContainer(
                            name: 'facebook1.png',
                          ),
                          SizedBox(
                            width: Dimensions.width20,
                          ),
                          Expanded(
                            child: Container(
                              height: Dimensions.height50,
                              decoration: BoxDecoration(
                                  color: Constants.mainColor,
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.height25)),
                              child: Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: Dimensions.height20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DateText(
                            date: "Don't have an account?",
                            color: Colors.black,
                          ),
                          DateText(
                            date: "Signup",
                            color: Constants.mainColor,
                          )
                        ],
                      )
                    ],
                  ),
                ],
              );
            }),
          ))
        ],
      ),
    );
  }
}
