import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocceryplus/theme/const/responsive.dart';
import 'package:grocceryplus/theme/const_color.dart';

class AddToBagController extends GetxController {
  final currentValue = 1.obs;
  final isPressed = false.obs;

  void increment() => currentValue.value++;
  void decrement() {
    if (currentValue.value > 1) {
      currentValue.value--;
    } else {
      isPressed.value = false;
    }
  }

  void pressButton() => isPressed.value = true;
}

class AddToBagButtonWidget extends StatelessWidget {
  final String buttonText;
  final IconData? icon;
  final VoidCallback onPress;
  //*used for passing the controller from outside
  final AddToBagController controller;

  const AddToBagButtonWidget({
    required this.onPress,
    required this.buttonText,
    required this.icon,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedContainer(
        height: Responsive.h(0.042),
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
        decoration: BoxDecoration(
          color: controller.isPressed.value
              ? ConstColor.DailyPlusGreenLight
              : ConstColor.DailyPlusGreenLight.withValues(alpha: 0.25),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: ConstColor.DailyPlusGreen,
            width: Responsive.w(0.002),
          ),
        ),
        child: controller.isPressed.value
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: Responsive.w(0.018)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: controller.decrement,
                      icon: Icon(
                        Icons.remove,
                        color: ConstColor.WhiteColor,
                        size: Responsive.w(0.056),
                      ),
                    ),
                    Obx(
                      () => Text(
                        controller.currentValue.value.toString(),
                        style: TextStyle(
                          color: ConstColor.WhiteColor,
                          fontSize: Responsive.fs(0.033),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: controller.increment,
                      icon: Icon(
                        Icons.add,
                        color: ConstColor.WhiteColor,
                        size: Responsive.w(0.056),
                      ),
                    ),
                  ],
                ),
              )
            : GestureDetector(
                onTap: () {
                  onPress();
                  controller.pressButton();
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Responsive.w(0.018),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        icon,
                        size: Responsive.w(0.056),
                        color: ConstColor.DailyPlusGreen,
                      ),
                      Text(
                        buttonText,
                        style: TextStyle(
                          color: ConstColor.DailyPlusGreen,
                          fontSize: Responsive.fs(0.035),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: Responsive.w(0.056)),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
