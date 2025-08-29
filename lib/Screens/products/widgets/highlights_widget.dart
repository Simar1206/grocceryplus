import 'package:flutter/material.dart';
import 'package:grocceryplus/models/products_model.dart';
import 'package:grocceryplus/theme/const/responsive.dart';
import 'package:grocceryplus/theme/const_color.dart';
import 'package:grocceryplus/widgets/is_Veg_button_widget.dart';
import 'package:grocceryplus/Screens/products/widgets/discription_widget.dart';

class HighlightsWidget extends StatelessWidget {
  final ProductsModel product;
  final bool clickedViewMore;
  final VoidCallback onToggle;

  const HighlightsWidget({
    super.key,
    required this.product,
    required this.clickedViewMore,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Responsive.w(0.034)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ConstColor.WhiteColor,
      ),
      child: Container(
        padding: EdgeInsets.all(Responsive.w(0.034)),
        decoration: BoxDecoration(
          color: ConstColor.shadowColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Highlights',
              style: TextStyle(
                fontSize: Responsive.fs(0.034),
                color: ConstColor.BlackColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: Responsive.h(0.01)),
        
            DiscriptionWidget(
              type: 'Brand',
              discription: product.Product_Name,
            ),
            SizedBox(height: Responsive.h(0.01)),
        
            DiscriptionWidget(
              type: 'Product Type',
              discription: product.Product_Category,
            ),
            SizedBox(height: Responsive.h(0.01)),
        
            AnimatedCrossFade(
              firstCurve: Curves.easeIn,
              secondCurve: Curves.easeOut,
              duration: const Duration(milliseconds: 400),
              crossFadeState: clickedViewMore
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              firstChild: GestureDetector(
                onTap: onToggle,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Responsive.w(0.027),
                    vertical: Responsive.h(0.008),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: ConstColor.GreyColor.withValues(alpha: 0.15),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'View More',
                        style: TextStyle(
                          fontSize: Responsive.fs(0.027),
                          fontWeight: FontWeight.w600,
                          color: Colors.pink,
                        ),
                      ),
                      SizedBox(width: Responsive.w(0.011)),
                      Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: Colors.pink,
                        size: Responsive.fs(0.055),
                      ),
                    ],
                  ),
                ),
              ),
              secondChild: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: Responsive.w(0.011)),
                  DiscriptionWidget(
                    type: 'Weight',
                    discription: product.Product_quantity,
                  ),
                  SizedBox(height: Responsive.h(0.01)),
        
                  DiscriptionWidget(
                    type: 'Deitary  preference',
                    widget: IsVegButtonWidget(IsVeg: product.IsVeg),
                  ),
                  SizedBox(height: Responsive.h(0.01)),
        
                  DiscriptionWidget(
                    type: 'Key Features',
                    discription: product.Product_description,
                  ),
                  SizedBox(height: Responsive.h(0.01)),
        
                  DiscriptionWidget(type: 'Imported'),
                  SizedBox(height: Responsive.h(0.01)),
        
                  DiscriptionWidget(type: 'Fssai Licensce'),
                  SizedBox(height: Responsive.h(0.01)),
        
                  DiscriptionWidget(type: 'Nutrition Information'),
                  SizedBox(height: Responsive.h(0.01)),
        
                  DiscriptionWidget(type: 'Packaging Type'),
                  SizedBox(height: Responsive.h(0.01)),
        
                  DiscriptionWidget(type: 'Imported'),
                  SizedBox(height: Responsive.h(0.01)),
        
                  DiscriptionWidget(type: 'Fssai Licensce'),
                  SizedBox(height: Responsive.h(0.01)),
        
                  DiscriptionWidget(
                    type: 'Rating',
                    discription: product.Product_rating.toString(),
                  ),
                  SizedBox(height: Responsive.h(0.01)),
        
                  DiscriptionWidget(
                    type: 'Price',
                    discription: product.Product_price.toString(),
                  ),
                  SizedBox(height: Responsive.h(0.01)),
        
                  GestureDetector(
                    onTap: onToggle,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'View Less',
                          style: TextStyle(
                            fontSize: Responsive.fs(0.027),
                            fontWeight: FontWeight.w600,
                            color: Colors.pink,
                          ),
                        ),
                        SizedBox(width: Responsive.w(0.011)),
                        Icon(
                          Icons.keyboard_arrow_up_outlined,
                          color: Colors.pink,
                          size: Responsive.fs(0.055),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
