import 'package:flutter/material.dart';
import 'package:grocceryplus/theme/const/responsive.dart';
import 'package:grocceryplus/theme/const_color.dart';

class CategoryCardWidget extends StatelessWidget {
  final String Category_image;
  final String Category_title;
  final VoidCallback onPress;
  const CategoryCardWidget({
    required this.Category_image,
    required this.Category_title,
    required this.onPress,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Card(
        elevation: 0,
        color: ConstColor.WhiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Category_image,
              height: Responsive.w(0.12),
              width: Responsive.w(0.332),
            ),

            SizedBox(height: Responsive.w(0.01)),

            Text(
              //textAlign: TextAlign.end,
              Category_title,
              style: TextStyle(
                fontSize: Responsive.fs(0.03),
                fontWeight: FontWeight.w500,
                color: ConstColor.normalBlack,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
