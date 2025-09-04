import 'package:flutter/material.dart';
import 'package:grocceryplus/theme/const_color.dart';

class PaymentOptionsListTileWidget extends StatelessWidget {
  final String? img;
  final String? title;
  final String? subtitle;
  final IconData? icon;
  final VoidCallback? onTap;

  const PaymentOptionsListTileWidget({
    super.key,
    this.img,
    this.title,
    this.subtitle,
    this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 2.0),
      child: GestureDetector(
        onTap: onTap,
        //borderRadius: BorderRadius.circular(15),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              //* Leading Icon/Image
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: ConstColor.WhiteColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: ConstColor.GreyColor.withValues(alpha: 0.3),
                  ),
                ),
                child: img != null
                    ? Image.asset(
                        img!,
                        fit: BoxFit.contain,
                        height: 35,
                        width: 35,
                      )
                    : Icon(
                        icon ?? Icons.credit_card,
                        size: 35,
                        color: ConstColor.DailyPlusGreen,
                      ),
              ),
              const SizedBox(width: 16),

              //* Title and Subtitle
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title ?? "N/A",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: ConstColor.BlackColor,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle ?? "No description",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: ConstColor.mediumBlack,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),

              //* Trailing Icon
              const SizedBox(width: 16),
              const Icon(
                Icons.keyboard_arrow_right,
                size: 28,
                color: Colors.pink,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
