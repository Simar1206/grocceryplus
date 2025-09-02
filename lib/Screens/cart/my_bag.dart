import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocceryplus/Screens/cart/cart_controller.dart';
import 'package:grocceryplus/Screens/cart/widgets/product_added_to_cart_widget.dart';
import 'package:grocceryplus/Screens/products/widgets/rounded_icon_widget.dart';
import 'package:grocceryplus/theme/const_color.dart';
import 'package:grocceryplus/widgets/action_button_widget.dart';
import 'package:grocceryplus/widgets/double_container_background_widget.dart';

class MyBag extends StatelessWidget {
  MyBag({super.key});

  CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(20),
        ),
        leading: RoundedIconWidget(
          icon: Icons.arrow_back_ios_new,
          color: ConstColor.BlackColor,
          iconPress: () {
            //TODO: Navigate back to homepage
          },
        ),
        title: Text(
          'Cart',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: Obx( () {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //*Product Added to cart
            ListView.builder(
            
              itemCount: cartController.cartItemList.length,
              itemBuilder: (context, index) {
                final product = cartController.cartItemList.keys.elementAt(
                  index,
                );
                return ProductAddedToCartWidget(product: product);
              },
            ),
          ],
        );}
    
      ),
    );
  }
}
