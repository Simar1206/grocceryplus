import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocceryplus/controller/cart_controller.dart';
import 'package:grocceryplus/models/products_model.dart';
import 'package:grocceryplus/theme/const/responsive.dart';
import 'package:grocceryplus/theme/const_color.dart';
import 'package:grocceryplus/widgets/bottom_navigation_widget.dart';

// class AddToBagController extends GetxController {
//   final currentValue = 1.obs;
//   final isPressed = false.obs;

//   void increment() => currentValue.value++;
//   void decrement() {
//     if (currentValue.value > 1) {
//       currentValue.value--;
//     } else {
//       isPressed.value = false;
//     }
//   }

//   void pressButton() => isPressed.value = true;
// }

class AddToBagButtonWidget extends StatelessWidget {
  final String buttonText;
  final IconData? icon;
  //final VoidCallback onPress;
  final ProductsModel product;

  final NavigationController navigationController =
      Get.find<NavigationController>();

  AddToBagButtonWidget({
    //required this.onPress,
    required this.buttonText,
    required this.icon,
    required this.product,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //*used for passing the controller from outside
    CartController cartController = Get.find<CartController>();

    return Obx(() {
      // Check if product exists in cart
      final productIndex = cartController.cartItemList.indexWhere(
        (e) =>
            // e.IsVeg == product.IsVeg &&
            // e.Product_Category == product.Product_Category &&
            // e.Product_Image == product.Product_Image &&
            e.Product_Name == product.Product_Name,
        // e.Product_description == product.Product_description &&
        // e.Product_price == product.Product_price &&
        // e.Product_quantity == product.Product_quantity &&
        // e.Product_rating == product.Product_rating,
      );

      final hasItem = productIndex != -1;
      return AnimatedContainer(
        height: Responsive.h(0.042),
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
        decoration: BoxDecoration(
          color: hasItem
              ? ConstColor.DailyPlusGreenLight
              : ConstColor.DailyPlusGreenLight.withValues(alpha: 0.25),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: ConstColor.DailyPlusGreen,
            width: Responsive.w(0.002),
          ),
        ),
        child: hasItem
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: Responsive.w(0.018)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        cartController.decrement(productIndex);
                      },
                      icon: Icon(
                        Icons.remove,
                        color: ConstColor.WhiteColor,
                        size: Responsive.w(0.056),
                      ),
                    ),
                    Obx(
                      () => Text(
                        "${cartController.cartItemList.elementAt(productIndex).selectedQuantity}",
                        style: TextStyle(
                          color: ConstColor.WhiteColor,
                          fontSize: Responsive.fs(0.033),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        cartController.addtoCartOrIncrement(product);
                      },
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
                  //onPress();
                  //navigationController.selectedValue.value = 2;
                  cartController.addtoCartOrIncrement(product);
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
      );
    });
  }
}
