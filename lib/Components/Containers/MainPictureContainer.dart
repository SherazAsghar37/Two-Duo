import 'package:flutter/material.dart';

import '../Helpers/dimensions.dart';

class MainPictureContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height100 * 3,
      width: double.maxFinite,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(Dimensions.height20),
            bottomRight: Radius.circular(Dimensions.height20),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(-5, 5),
              color: Colors.grey.shade300,
              blurRadius: 10,
            ),
            BoxShadow(
              offset: Offset(5, -5),
              color: Colors.grey.shade300,
              blurRadius: 10,
            ),
          ]),
      child: Center(child: Image.asset('images/listimage.png')),
    );
  }
}
