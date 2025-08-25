import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:grocceryplus/theme/const/responsive.dart';
import 'package:grocceryplus/theme/const_color.dart';

class RatingBarWidget extends StatelessWidget {
  final int Product_rating;
  const RatingBarWidget({super.key, required this.Product_rating});

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      minRating: 1,
      maxRating: 5,

      allowHalfRating: true,
      itemSize:Responsive.w(0.046),
      initialRating: Product_rating.toDouble(),
      itemCount: 5,
      itemPadding: EdgeInsetsGeometry.only(right: 2),

      ratingWidget: RatingWidget(
        full: Icon(Icons.star, color: Colors.amber),
        half: Icon(Icons.star, color: Colors.amber),
        empty: Icon(
          Icons.star,
          color: ConstColor.GreyColor.withValues(alpha: 0.25),
        ),
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }
}
