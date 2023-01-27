import 'package:flutter/material.dart';
import 'package:twoduo/Components/Helpers/Constants.dart';
import 'package:twoduo/Components/Helpers/dimensions.dart';

class DescriptionText extends StatelessWidget {
  final String description;
  final int pageNo;
  final Color color;
  DescriptionText(
      {required this.description,
      required this.pageNo,
      this.color = Constants.shade500});

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: TextStyle(
        color: color == null ? Colors.grey.shade500 : color,
        fontSize: Dimensions.height10 + 3,
        overflow: TextOverflow.ellipsis,
      ),
      maxLines: pageNo == 0 ? 2 : 4,
    );
  }
}
