import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:grocceryplus/theme/const_color.dart';
import 'package:grocceryplus/widgets/add_to_bag_button_widget.dart';
import 'package:grocceryplus/widgets/is_Veg_button_widget.dart';
import 'package:grocceryplus/widgets/rating_bar_widget.dart';

class ProductCardWidget extends StatelessWidget {
  final String Product_Image;
  final String Product_name;
  final int Product_price;
  final int Product_rating;
  final String Product_quantity;
  final bool IsVeg;
  final VoidCallback onPress;

  const ProductCardWidget({
    required this.Product_Image,
    required this.Product_name,
    required this.Product_price,
    required this.onPress,
    super.key,
    required this.Product_rating,
    required this.IsVeg,
    required this.Product_quantity,
  });

  @override
  Widget build(BuildContext context) {
    //*controller for add to bag defined here:
    final AddToBagController bagController = AddToBagController();

    return GestureDetector(
      onTap: onPress,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //* Product Image Card
          Card(
            elevation: 0,
            color: ConstColor.WhiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            clipBehavior: Clip.antiAlias,
            child: SizedBox(
              height: 121,
              width: double.infinity,
              child: Center(
                //*added tag for hero animation:
                child: Hero(
                  createRectTween: (begin, end) {
                    return MaterialRectArcTween(begin: begin, end: end);
                  },
                  transitionOnUserGestures: true,
                  tag: '${Product_name}_$Product_Image',
                  child: Image.asset(Product_Image, fit: BoxFit.contain),
                ),
              ),
            ),
          ),

          const SizedBox(height: 12),

          //*veg + quanity
          Row(
            children: [
              //*veg logo
              IsVegButtonWidget(IsVeg: IsVeg),

              const SizedBox(width: 10),

              Text(
                Product_quantity,
                style: TextStyle(
                  fontSize: 15,
                  color: ConstColor.normalBlack,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          //*product name
          Expanded(
            child: SizedBox(
              // height: 42,
              // width: 164,
              child: Text(
                //textAlign: TextAlign.end,
                Product_name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: ConstColor.normalBlack,
                ),
              ),
            ),
          ),

          const SizedBox(height: 5),

          RatingBarWidget(Product_rating: Product_rating),

          const SizedBox(height: 10),

          //price
          Text(
            textAlign: TextAlign.left,
            '\$$Product_price',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: ConstColor.AccentColor,
            ),
          ),

          const SizedBox(height: 12),

          //button
          AddToBagButtonWidget(
            controller: bagController,
            onPress: () {},
            buttonText: 'Add to Bag',
            icon: Icons.shopping_bag,
          ),
        ],
      ),
    );
  }
}
