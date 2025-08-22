import 'package:flutter/material.dart';
import 'package:grocceryplus/theme/const_color.dart';

class DiscriptionWidget extends StatelessWidget {
  final String type;
  final String? discription;
  final Widget? widget;
  const DiscriptionWidget({
    super.key,
    required this.type,
    this.discription,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,

      children: [
        Expanded(
          flex: 1,
          child: Text(
            type,
            style: TextStyle(
              fontSize: 12,
              color: ConstColor.mediumBlack,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            discription ?? 'N/A',
            style: TextStyle(
              fontSize: 12,
              color: ConstColor.BlackColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
