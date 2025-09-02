import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';
import 'package:grocceryplus/Screens/cart/cart_controller.dart';
import 'package:grocceryplus/Screens/cart/my_bag.dart';
import 'package:grocceryplus/models/products_model.dart';
import 'package:grocceryplus/theme/const/responsive.dart';
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
  final ProductsModel product;
  const AnimatedButtonForCart({super.key, required this.product});

  @override
  State<AnimatedButtonForCart> createState() => _AnimatedButtonForCartState();
}

class _AnimatedButtonForCartState extends State<AnimatedButtonForCart> {
  final CartController cartController = Get.find<CartController>();

  late final AnimatedButtonController controller;

  @override
  void initState() {
    super.initState();

    // unique controller per product
    controller = Get.put(
      AnimatedButtonController(),
      tag: widget.product.Product_Name,
    );

    final qtyInCart = cartController.cartItemList[widget.product] ?? 1;
    controller.currentValue.value = qtyInCart;
    controller.isPressed.value = qtyInCart > 1;
  }

  @override
  Widget build(BuildContext context) {
    final collapsedWidth = Responsive.fs(0.88);
    final expandedWidth = Responsive.fs(0.44);

    return Obx(
      () => Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeInOut,
            height: Responsive.h(0.051),
            width: controller.isPressed.value ? expandedWidth : collapsedWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: ConstColor.DailyPlusGreen,
            ),
            child: controller.isPressed.value
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          controller.Dec();
                          cartController.addtoCart(
                            widget.product,
                            quantity: controller.currentValue.value,
                          );
                        },
                        icon: const Icon(Icons.remove),
                        color: ConstColor.WhiteColor,
                      ),
                      Obx(
                        () => Text(
                          controller.currentValue.value.toString(),
                          style: TextStyle(
                            color: ConstColor.WhiteColor,
                            fontSize: Responsive.fs(0.04),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          controller.Inc();
                          cartController.addtoCart(
                            widget.product,
                            quantity: controller.currentValue.value,
                          );
                        },
                        icon: const Icon(Icons.add),
                        color: ConstColor.WhiteColor,
                      ),
                    ],
                  )
                : Center(
                    child: GestureDetector(
                      onTap: () {
                        controller.PushButton();
                        cartController.addtoCart(
                          widget.product,
                          quantity: controller.currentValue.value,
                        );
                      },
                      child: Text(
                        'Add to Cart',
                        style: TextStyle(
                          color: ConstColor.WhiteColor,
                          fontSize: Responsive.fs(0.04),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
          ),

          SizedBox(width: Responsive.w(0.02)),

          if (controller.isPressed.value)
            AnimatedContainer(
              height: Responsive.h(0.051),
              width: expandedWidth,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.pink, width: 2),
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyBag()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_cart_outlined,
                      size: Responsive.w(0.055),
                    ),
                    SizedBox(width: Responsive.w(0.01)),
                    Text(
                      'View In Cart',
                      style: TextStyle(
                        fontSize: Responsive.fs(0.04),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
