import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocceryplus/controller/cart_controller.dart';
import 'package:grocceryplus/Screens/products/product_details_page.dart';
import 'package:grocceryplus/models/products_model.dart';
import 'package:grocceryplus/theme/const_color.dart';

class ProductAddedToCartWidget extends StatefulWidget {
  final ProductsModel product;
  final int index;
  const ProductAddedToCartWidget({
    super.key,
    required this.product,
    required this.index,
  });

  @override
  State<ProductAddedToCartWidget> createState() =>
      _ProductAddedToCartWidgetState();
}

class _ProductAddedToCartWidgetState extends State<ProductAddedToCartWidget> {
  //* Global Cart Controller:
  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //* Navigate to the product Clicked:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsPage(product: widget.product),
          ),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //*Image
          Image.asset(
            widget.product.Product_Image,
            height: 70,
            width: 70,
            fit: BoxFit.contain,
          ),
          SizedBox(width: 17),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //*Product Name + Quantity
                Text(
                  overflow: TextOverflow.ellipsis,
                  widget.product.Product_Name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: ConstColor.BlackColor,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  widget.product.Product_quantity.toString(),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: ConstColor.mediumBlack,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(width: 10),

          //* counter
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.pink.withValues(alpha: 0.4),
                width: 1,
              ),
              color: Colors.pink.withValues(alpha: 0.15),
            ),
            child: Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  //* DEC
                  IconButton(
                    onPressed: () {
                      cartController.decrement(widget.index);
                    },
                    icon: Icon(Icons.remove, size: 20, color: Colors.pink),
                  ),
                  //* TEXT
                  Text(
                    "${cartController.cartItemList.elementAt(widget.index).selectedQuantity.value}",
                    //widget.product.selectedQuantity.toString(),
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  //* INC
                  IconButton(
                    onPressed: () {
                      cartController.addtoCartOrIncrement(widget.product);
                    },
                    icon: Icon(Icons.add, size: 20, color: Colors.pink),
                  ),
                ],
              );
            }),
          ),
          SizedBox(width: 15),

          //* Product Price
          Obx(() {
            return Text(
              "\$ ${(widget.product.Product_price * widget.product.selectedQuantity.value).toStringAsFixed(2)}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            );
          }),
        ],
      ),
    );
  }
}
