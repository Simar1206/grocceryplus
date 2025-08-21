import 'package:flutter/material.dart';
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
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ConstColor.GreyColor.withValues(alpha: 0.25),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, size: 30, color: ConstColor.BlackColor),
            const SizedBox(height: 10),
            Text(
              text,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: ConstColor.BlackColor,
              ),
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
