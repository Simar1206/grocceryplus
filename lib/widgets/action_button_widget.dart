import 'package:flutter/material.dart';
import 'package:grocceryplus/theme/const_color.dart';

class ActionButtonWidget extends StatelessWidget {
  final String ButtonText;
  final IconData? icon;
  final VoidCallback onPress;
  const ActionButtonWidget({
    required this.onPress,
    required this.ButtonText,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        height: 48,
        child: TextButton(
          style: ButtonStyle(
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(8),
              ),
            ),
            iconColor: WidgetStatePropertyAll(ConstColor.WhiteColor),
            textStyle: WidgetStatePropertyAll(
              TextStyle(
                color: ConstColor.WhiteColor,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            backgroundColor: WidgetStatePropertyAll(ConstColor.DailyPlusGreen),
          ),
          onPressed: onPress,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(textAlign: TextAlign.center, ''),
              Text(
                textAlign: TextAlign.center,
                ButtonText,
                style: TextStyle(color: ConstColor.WhiteColor),
              ),
              Icon(icon, size: 24),
            ],
          ),
        ),
      ),
    );
  }
}
