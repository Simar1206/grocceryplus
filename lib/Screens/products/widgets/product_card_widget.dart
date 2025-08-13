import 'package:flutter/material.dart';
import 'package:grocceryplus/theme/const_color.dart';
import 'package:grocceryplus/widgets/action_button_widget.dart';
import 'package:grocceryplus/widgets/add_to_bag_button_widget.dart';

class ProductCardWidget extends StatelessWidget {
  final String Product_Image;
  final String Product_name;
  final int Product_price;
  final VoidCallback onPress;

  ProductCardWidget({
    required this.Product_Image,
    required this.Product_name,
    required this.Product_price,
    required this.onPress,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //card
          Card(
            elevation: 0,
            color: ConstColor.TextfieldBackground,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(10),
            ),
            child: Image.asset(Product_Image),
          ),

          const SizedBox(height: 12),

          //product name
          SizedBox(
            height: 42,
            width: 164,
            child: Text(
              //textAlign: TextAlign.end,
              Product_name,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: ConstColor.normalBlack,
              ),
            ),
          ),

          const SizedBox(height: 10),

          //price
          Text(
            textAlign: TextAlign.left,
            '\$$Product_price',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: ConstColor.AccentColor,
            ),
          ),

          const SizedBox(height: 12),

          //button
          AddToBagButtonWidget(
            onPress: () {},
            ButtonText: 'Add To Bag',
            icon: Icons.shopping_bag_outlined,
          ),
        ],
      ),
    );
  }
}
