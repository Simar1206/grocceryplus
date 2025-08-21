import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';
import 'package:grocceryplus/theme/const_color.dart';

class AnimatedButtonController extends GetxController {
  final currentValue = 1.obs;
  void Inc() => currentValue.value++;
  void Dec() {
    if (currentValue.value > 1) {
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
  //*obj for the controller
  AnimatedButtonController controller = Get.put(AnimatedButtonController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          controller.PushButton();
        },
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.end,

          // ? MainAxisAlignment.end
          // : MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: Duration(seconds: 1),
              curve: Curves.easeInOut,
              height: 48,
              width: controller.isPressed.value ? 200 : 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: ConstColor.DailyPlusGreen,
              ),
              child: controller.isPressed.value
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //*dec
                        IconButton(
                          onPressed: () {
                            controller.Dec();
                          },
                          icon: Icon(Icons.remove),
                          iconSize: 24,
                          color: ConstColor.WhiteColor,
                        ),
                        //*text:
                        Obx(
                          () => Text(
                            controller.currentValue.value.toString(),
                            style: TextStyle(
                              color: ConstColor.WhiteColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),

                        //*inc
                        IconButton(
                          onPressed: () {
                            controller.Inc();
                          },
                          icon: Icon(Icons.add),
                          iconSize: 24,
                          color: ConstColor.WhiteColor,
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Add to Cart',
                          style: TextStyle(
                            color: ConstColor.WhiteColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
            ),
            const SizedBox(width: 5),

            controller.isPressed.value
                ? Row(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AnimatedContainer(
                        transform: controller.isPressed.value
                            ? Matrix4.identity()
                            : Matrix4.translationValues(200.0, 0.0, 0.0),
                        height: 48,
                        width: 200,
                        duration: Duration(seconds: 1),
                        curve: Curves.easeInOut,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.pink, width: 2),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.shopping_cart_outlined,
                              color: ConstColor.BlackColor,
                              size: 24,
                            ),

                            const SizedBox(width: 5),

                            GestureDetector(
                              onTap: () {
                                
                              },
                              child: Text(
                                'View In Cart',
                                style: TextStyle(
                                  color: ConstColor.BlackColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
