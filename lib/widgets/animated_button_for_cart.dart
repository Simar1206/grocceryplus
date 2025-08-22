import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';
import 'package:grocceryplus/theme/const_color.dart';

class AnimatedButtonController extends GetxController {
  final currentValue = 1.obs;
  void Inc() => currentValue.value++;
  void Dec() {
    if (currentValue.value > 1) {
      print(currentValue.value);
      currentValue.value--;
    } else {
      isPressed.value = false;
    }
  }

  final isPressed = false.obs;

  void PushButton() {
    isPressed.value = true;
  }
}

class AnimatedButtonForCart extends StatefulWidget {
  const AnimatedButtonForCart({super.key});

  @override
  State<AnimatedButtonForCart> createState() => _AnimatedButtonForCartState();
}

class _AnimatedButtonForCartState extends State<AnimatedButtonForCart> {
  final AnimatedButtonController controller = Get.put(
    AnimatedButtonController(),
  );

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Instead of hardcoding, calculate based on screen width
    final collapsedWidth = screenWidth * 0.88; // 90% of screen
    final expandedWidth = screenWidth * 0.44; // 45% of screen

    return Obx(
      () => GestureDetector(
        onTap: controller.PushButton,
        child: Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              height: 48,
              width: controller.isPressed.value
                  ? expandedWidth
                  : collapsedWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: ConstColor.DailyPlusGreen,
              ),
              child: controller.isPressed.value
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: controller.Dec,
                          icon: const Icon(Icons.remove),
                          color: ConstColor.WhiteColor,
                        ),
                        Obx(
                          () => Text(
                            controller.currentValue.value.toString(),
                            style: TextStyle(
                              color: ConstColor.WhiteColor,
                              fontSize: screenWidth * 0.04, // responsive font
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: controller.Inc,
                          icon: const Icon(Icons.add),
                          color: ConstColor.WhiteColor,
                        ),
                      ],
                    )
                  : Center(
                      child: Text(
                        'Add to Cart',
                        style: TextStyle(
                          color: ConstColor.WhiteColor,
                          fontSize: screenWidth * 0.04, // responsive font
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
            ),
            const SizedBox(width: 8),
            if (controller.isPressed.value)
              AnimatedContainer(
                height: 48,
                width: expandedWidth,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.pink, width: 2),
                ),
                child: InkWell(
                  onTap: () {
                    // TODO: Navigate to cart
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.shopping_cart_outlined, size: 24),
                      const SizedBox(width: 6),
                      Text(
                        'View In Cart',
                        style: TextStyle(
                          fontSize: screenWidth * 0.04, // responsive font
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
