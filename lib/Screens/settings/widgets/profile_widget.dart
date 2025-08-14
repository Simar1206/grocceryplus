import 'package:flutter/material.dart';
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
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: ConstColor.DailyPlusGreenLight.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Icon(size: 50, Icons.person, color: ConstColor.DailyPlusGreen),
        ),

        const SizedBox(width: 11),

        //*Text
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //*to display two different text style
            Text(
              user_name ?? '',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),

            Text(
              Phone_number ?? '8657 68145',
              style: TextStyle(
                color: ConstColor.mediumBlack,
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
