import 'package:flutter/material.dart';

import '../Helpers/dimensions.dart';

class googleIconContainer extends StatelessWidget {
  final String name;
  googleIconContainer({required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height50,
      width: Dimensions.height50,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Dimensions.height50),
          image: DecorationImage(image: AssetImage('images/$name'))),
    );
  }
}
