import 'package:flutter/material.dart';

class ProductCardWidget extends StatelessWidget {
  final String Product_Image;
  final String Product_name;
  final int Product_price;
  ProductCardWidget({
    required this.Product_Image,
    required this.Product_name,
    required this.Product_price,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //card
        Card(),
        //button
      ],
    );
  }
}
