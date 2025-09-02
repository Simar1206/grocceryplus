import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocceryplus/Screens/cart/cart_controller.dart';
import 'package:grocceryplus/models/products_model.dart';
import 'package:grocceryplus/theme/const_color.dart';

class ProductAddedToCartWidget extends StatefulWidget {
  final ProductsModel product;
  const ProductAddedToCartWidget({super.key, required this.product});

  @override
  State<ProductAddedToCartWidget> createState() =>
      _ProductAddedToCartWidgetState();
}

class _ProductAddedToCartWidgetState extends State<ProductAddedToCartWidget> {
 
 //* Global Cart Controller:
 final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        //*Image
        Image.asset(
          widget.product.Product_Image,
          height: 121,
          width: 115,
          fit: BoxFit.contain,
        ),
        SizedBox(width: 17),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //*Product Name + Quantity
            Text(
              widget.product.Product_Name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 5),
            Text(
              widget.product.Product_Name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: ConstColor.mediumBlack,
              ),
            ),
          ],
        ),
        //* counter
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.pink, width: 1),
            color: Colors.pink.withValues(alpha: 0.25),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //*DEC
              IconButton(
                onPressed: () {
                  //TODO: Decrement Counter and Product Price
                  cartController.decrementProductQuantity(widget.product);
                },
                icon: Icon(Icons.remove, size: 20),
              ),
              //*TEXT
              Obx(() {
                int quantity = cartController.cartItemList[widget.product] ?? 0;
                return Text(
                  quantity.toString(),
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                );
              }),
              //*INC
              IconButton(
                onPressed: () {
                  //TODO: Increment Counter and Product Price
                  cartController.decrementProductQuantity(widget.product);
                },
                icon: Icon(Icons.add, size: 20),
              ),

              //*Product Price
              Text(
                "₹${widget.product.Product_price.toString()}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ProductCounter extends GetxController {
  final currentValue = 0.obs;

  void inc() => currentValue.value++;

  void dec() {
    if (currentValue.value > 1) {
      currentValue.value--;
    }
    return;
  }
}
