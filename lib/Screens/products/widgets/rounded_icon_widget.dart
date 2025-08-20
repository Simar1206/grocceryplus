import 'package:flutter/material.dart';
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
        padding: const EdgeInsets.all(8.0),
        child: Container(
          //margin: EdgeInsets.all(2),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            
            color: ConstColor.WhiteColor,
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: ConstColor.GreyColor.withValues(alpha: 0.25)),
          ),
          child: Icon(icon, size: 24, color: color),
        ),
      ),
    );
  }
}
