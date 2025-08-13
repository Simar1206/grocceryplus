import 'package:flutter/material.dart';
import 'package:grocceryplus/theme/const_color.dart';

class AddToBagButtonWidget extends StatelessWidget {
  final String ButtonText;
  final IconData? icon;
  final VoidCallback onPress;
  const AddToBagButtonWidget({
    required this.onPress,
    required this.ButtonText,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 35,
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
            Icon(icon, size: 24),
    
            Text(
              textAlign: TextAlign.center,
              ButtonText,
              style: TextStyle(color: ConstColor.WhiteColor),
            ),
    
            Text(textAlign: TextAlign.center, ''),
          ],
        ),
      ),
    );
  }
}
