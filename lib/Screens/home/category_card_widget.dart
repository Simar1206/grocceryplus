import 'package:flutter/material.dart';
import 'package:grocceryplus/theme/const_color.dart';

class CategoryCardWidget extends StatelessWidget {
  final String Category_image;
  final String Category_title;
  final VoidCallback onPress;
  CategoryCardWidget({
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
            Image.asset(Category_image),

            const SizedBox(height: 10),

            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                //textAlign: TextAlign.end,
                Category_title,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: ConstColor.normalBlack,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
