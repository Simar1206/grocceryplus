import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocceryplus/controller/cart_controller.dart';
import 'package:grocceryplus/theme/const/responsive.dart';
import 'package:grocceryplus/theme/const_color.dart';

class ReactiveButtonForPayment extends StatelessWidget {
  final IconData? icon;
  final VoidCallback onPress;
  const ReactiveButtonForPayment({
    required this.onPress,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //*Getx Controller:
    CartController cartController = Get.find<CartController>();

    return SizedBox(
      height: Responsive.h(0.051),
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
              fontSize: Responsive.fs(0.037),
            ),
          ),
          backgroundColor: WidgetStatePropertyAll(Colors.pink),
        ),
        onPressed: onPress,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(textAlign: TextAlign.center, ''),
            Obx(
              () => Text(
                textAlign: TextAlign.center,
                "Click to Pay \$${cartController.totalCost}",
                style: TextStyle(
                  color: ConstColor.WhiteColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Icon(icon, size: Responsive.w(0.055)),
          ],
        ),
      ),
    );
  }
}
