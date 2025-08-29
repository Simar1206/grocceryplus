import 'package:flutter/material.dart';
import 'package:grocceryplus/theme/const/responsive.dart';
import 'package:grocceryplus/theme/const_color.dart';

class RoundedIconWidget extends StatelessWidget {
  final IconData? icon;
  final Color color;
  final VoidCallback iconPress;

  const RoundedIconWidget({
    super.key,
    required this.icon,
    required this.color,
    required this.iconPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: iconPress,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Responsive.w(0.01),
          vertical: Responsive.h(0.005),
        ),
        child: Container(
          //margin: EdgeInsets.all(Responsive.w(0.004)),
          padding: EdgeInsets.all(Responsive.w(0.018)),
          decoration: BoxDecoration(
            color: ConstColor.WhiteColor,
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color: ConstColor.GreyColor.withValues(alpha: 0.25),
            ),
          ),
          child: Icon(icon, size: Responsive.w(0.065), color: color),
        ),
      ),
    );
  }
}
