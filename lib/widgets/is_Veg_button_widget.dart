import 'package:flutter/material.dart';
import 'package:grocceryplus/theme/const/responsive.dart';
import 'package:grocceryplus/theme/const_color.dart';

class IsVegButtonWidget extends StatelessWidget {
  final bool IsVeg;
  const IsVegButtonWidget({super.key, required this.IsVeg});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Responsive.w(0.006)),
      height: Responsive.h(0.019),
      width: Responsive.w(0.041),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          width: Responsive.w(0.004),
          color: IsVeg ? ConstColor.DarkGreenColor : Colors.red,
        ),
      ),
      child: Container(
        height: Responsive.h(0.021),
        width: Responsive.h(0.046),
        decoration: BoxDecoration(
          color: IsVeg ? ConstColor.DarkGreenColor : Colors.red,
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}
