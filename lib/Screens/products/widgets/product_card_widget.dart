import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:grocceryplus/theme/const/responsive.dart';
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
      child: Container(
        padding: EdgeInsets.all(Responsive.w(0.041)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ConstColor.shadowColor,
        ),
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
                height: Responsive.h(0.13),
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

            SizedBox(height: Responsive.w(0.012)),

            //*veg + quanity
            Row(
              children: [
                //*veg logo
                IsVegButtonWidget(IsVeg: IsVeg),

                SizedBox(width: Responsive.w(0.023)),

                Text(
                  Product_quantity,
                  style: TextStyle(
                    fontSize: Responsive.fs(0.034),
                    color: ConstColor.normalBlack,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

            SizedBox(height: Responsive.h(0.010)),

            //*product name
            Text(
              Product_name,
              maxLines: 2,
              style: TextStyle(
                fontSize: Responsive.fs(0.04),
                fontWeight: FontWeight.w500,
                color: ConstColor.normalBlack,
              ),
            ),

            SizedBox(height: Responsive.h(0.005)),

            RatingBarWidget(Product_rating: Product_rating),

            SizedBox(height: Responsive.h(0.01)),

            //price
            Text(
              textAlign: TextAlign.left,
              '\$$Product_price',
              style: TextStyle(
                fontSize: Responsive.fs(0.042),
                fontWeight: FontWeight.w500,
                color: ConstColor.AccentColor,
              ),
            ),

            SizedBox(height: Responsive.h(0.013)),

            //button
            AddToBagButtonWidget(
              controller: bagController,
              onPress: () {},
              buttonText: 'Add to Bag',
              icon: Icons.shopping_bag,
            ),
          ],
        ),
      ),
    );
  }
}
