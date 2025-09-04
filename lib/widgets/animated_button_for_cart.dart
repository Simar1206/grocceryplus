import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';
import 'package:grocceryplus/controller/cart_controller.dart';
import 'package:grocceryplus/Screens/cart/my_bag.dart';
import 'package:grocceryplus/models/products_model.dart';
import 'package:grocceryplus/theme/const/responsive.dart';
import 'package:grocceryplus/theme/const_color.dart';
import 'package:grocceryplus/widgets/bottom_navigation_widget.dart';

class AnimatedButtonForCart extends StatefulWidget {
  final ProductsModel product;
  const AnimatedButtonForCart({super.key, required this.product});

  @override
  State<AnimatedButtonForCart> createState() => _AnimatedButtonForCartState();
}

class _AnimatedButtonForCartState extends State<AnimatedButtonForCart> {
  //*Getx animatedButtonController:
  final CartController cartController = Get.find<CartController>();
  final NavigationController navigationController =
      Get.find<NavigationController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final collapsedWidth = Responsive.fs(0.88);
    final expandedWidth = Responsive.fs(0.44);

    return Obx(() {
      final productIndex = cartController.cartItemList.indexWhere(
        (e) =>
            // e.IsVeg == widget.product.IsVeg &&
            // e.Product_Category == widget.product.Product_Category &&
            // e.Product_Image == widget.product.Product_Image &&
            e.Product_Name == widget.product.Product_Name,
        // e.Product_description == widget.product.Product_description &&
        // e.Product_price == widget.product.Product_price &&
        // e.Product_quantity == widget.product.Product_quantity &&
        // e.Product_rating == widget.product.Product_rating,
      );

      final hasItem = productIndex != -1;

      return Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeInOut,
            height: Responsive.h(0.051),
            width: hasItem ? expandedWidth : collapsedWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: ConstColor.DailyPlusGreen,
            ),
            child: hasItem
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          cartController.decrement(productIndex);
                          //cartController.addtoCart(widget.product);
                        },
                        icon: const Icon(Icons.remove),
                        color: ConstColor.WhiteColor,
                      ),
                      Obx(
                        () => Text(
                          "${cartController.cartItemList.elementAt(productIndex).selectedQuantity}",
                          style: TextStyle(
                            color: ConstColor.WhiteColor,
                            fontSize: Responsive.fs(0.04),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          cartController.addtoCartOrIncrement(widget.product);
                        },
                        icon: const Icon(Icons.add),
                        color: ConstColor.WhiteColor,
                      ),
                    ],
                  )
                : Center(
                    child: GestureDetector(
                      onTap: () {
                        cartController.addtoCartOrIncrement(widget.product);
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

          if (hasItem)
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyBag()),
                );
              },
              child: AnimatedContainer(
                height: Responsive.h(0.051),
                width: expandedWidth,
                duration: const Duration(milliseconds: 500),
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
      );
    });
  }
}
