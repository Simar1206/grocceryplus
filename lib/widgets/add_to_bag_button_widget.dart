import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocceryplus/theme/const_color.dart';

class AddToBagController extends GetxController {
  final currentValue = 0.obs;
  final isPressed = false.obs;

  void increment() => currentValue.value++;
  void decrement() {
    if (currentValue.value > 0) {
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

  AddToBagButtonWidget({
    required this.onPress,
    required this.buttonText,
    required this.icon,
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedContainer(
        height: 40,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
        decoration: BoxDecoration(
          color: controller.isPressed.value
              ? ConstColor.DailyPlusGreenLight
              : ConstColor.DailyPlusGreenLight.withValues(alpha: 0.25),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: ConstColor.DailyPlusGreen, width: 1),
        ),
        child: controller.isPressed.value
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: controller.decrement,
                      icon: Icon(
                        Icons.remove,
                        color: ConstColor.WhiteColor,
                        size: 24,
                      ),
                    ),
                    Obx(
                      () => Text(
                        controller.currentValue.value.toString(),
                        style: TextStyle(
                          color: ConstColor.WhiteColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: controller.increment,
                      icon: Icon(
                        Icons.add,
                        color: ConstColor.WhiteColor,
                        size: 24,
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
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(icon, size: 24, color: ConstColor.DailyPlusGreen),
                      Text(
                        buttonText,
                        style: TextStyle(
                          color: ConstColor.DailyPlusGreen,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 24),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
