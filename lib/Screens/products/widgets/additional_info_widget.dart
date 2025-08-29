import 'package:flutter/material.dart';
import 'package:grocceryplus/theme/const/responsive.dart';
import 'package:grocceryplus/theme/const_color.dart';

class AdditionalInfoWidget extends StatelessWidget {
  final IconData? icon;
  final String text;
  final VoidCallback onPress;
  const AdditionalInfoWidget({
    super.key,
    this.icon,
    required this.text,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    //Responsive.init(context);

    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: Responsive.h(0.15),
        width: Responsive.w(0.40),
        padding: EdgeInsets.all(Responsive.w(0.025)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ConstColor.shadowColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, size: Responsive.w(0.07), color: ConstColor.BlackColor),
            SizedBox(height: Responsive.h(0.01)),
            Flexible(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: Responsive.fs(0.028),
                  fontWeight: FontWeight.w500,
                  color: ConstColor.BlackColor,
                ),
              ),
            ),
            SizedBox(height: Responsive.h(0.05)),
          ],
        ),
      ),
    );
  }
}
