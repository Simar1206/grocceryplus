import 'package:flutter/material.dart';
import 'package:grocceryplus/theme/const_color.dart';

class IsVegButtonWidget extends StatelessWidget {
  final bool IsVeg;
  const IsVegButtonWidget({super.key, required this.IsVeg});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3),
      height: 20,
      width: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          width: 2,
          color: IsVeg ? ConstColor.DarkGreenColor : Colors.red,
        ),
      ),
      child: Container(
        height: 15,
        width: 15,
        decoration: BoxDecoration(
          color: IsVeg ? ConstColor.DarkGreenColor : Colors.red,
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}
