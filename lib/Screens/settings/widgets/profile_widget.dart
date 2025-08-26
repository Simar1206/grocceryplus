import 'package:flutter/material.dart';
import 'package:grocceryplus/theme/const/responsive.dart';
import 'package:grocceryplus/theme/const_color.dart';

class ProfileWidget extends StatelessWidget {
  String? user_name;
  String? Phone_number;

  ProfileWidget({this.Phone_number, this.user_name, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(Responsive.w(0.002)),
          decoration: BoxDecoration(
            color: ConstColor.DailyPlusGreenLight.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Icon(
            size: Responsive.w(0.12),
            Icons.person,
            color: ConstColor.DailyPlusGreen,
          ),
        ),

        SizedBox(width: Responsive.w(0.025)),

        //*Text
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //*to display two different text style
            Text(
              user_name ?? '',
              style: TextStyle(
                fontSize: Responsive.fs(0.04),
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(height: Responsive.w(0.0023)),

            Text(
              Phone_number ?? '8657 68145',
              style: TextStyle(
                color: ConstColor.mediumBlack,
                fontSize: Responsive.w(0.023),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
