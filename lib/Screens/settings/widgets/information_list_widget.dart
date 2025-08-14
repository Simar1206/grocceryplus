import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:grocceryplus/theme/const_color.dart';

class InformationListWidget extends StatelessWidget {
  const InformationListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: ConstColor.GreyColor),
        color: ConstColor.WhiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleCategoryWidget(
            icon: Icons.shopping_bag_outlined,
            text: 'Your Orders',
          ),

          const SizedBox(height: 5),
          DottedLine(
            lineLength: double.infinity,
            lineThickness: 1,
            dashColor: ConstColor.GreyColor,
          ),
          const SizedBox(height: 5),

          SingleCategoryWidget(
            icon: Icons.wallet_outlined,
            text: 'E-Gift Cards',
          ),

          const SizedBox(height: 5),
          DottedLine(
            lineLength: double.infinity,
            lineThickness: 1,
            dashColor: ConstColor.GreyColor,
          ),
          const SizedBox(height: 5),

          SingleCategoryWidget(
            icon: Icons.chat_bubble_outline_outlined,
            text: 'Help & Support',
          ),

          const SizedBox(height: 5),
          DottedLine(
            lineLength: double.infinity,
            lineThickness: 1,
            dashColor: ConstColor.GreyColor,
          ),
          const SizedBox(height: 5),

          SingleCategoryWidget(
            icon: Icons.currency_rupee_sharp,
            text: 'Refunds',
          ),

          const SizedBox(height: 5),
          DottedLine(
            lineLength: double.infinity,
            lineThickness: 1,
            dashColor: ConstColor.GreyColor,
          ),
          const SizedBox(height: 5),

          SingleCategoryWidget(
            icon: Icons.location_on_outlined,
            text: 'Saved Addresses',
          ),

          const SizedBox(height: 5),
          DottedLine(
            lineLength: double.infinity,
            lineThickness: 1,
            dashColor: ConstColor.GreyColor,
          ),
          const SizedBox(height: 5),

          SingleCategoryWidget(icon: Icons.person_2_outlined, text: 'Profile'),

          const SizedBox(height: 5),
          DottedLine(
            lineLength: double.infinity,
            lineThickness: 1,
            dashColor: ConstColor.GreyColor,
          ),
          const SizedBox(height: 5),

          SingleCategoryWidget(
            icon: Icons.card_giftcard_outlined,
            text: 'Rewards',
          ),

          const SizedBox(height: 5),
          DottedLine(
            lineLength: double.infinity,
            lineThickness: 1,
            dashColor: ConstColor.GreyColor,
          ),
          const SizedBox(height: 5),

          SingleCategoryWidget(
            icon: Icons.payment_outlined,
            text: 'Payment Management',
          ),
        ],
      ),
    );
  }
}

class InformationListWidgetSecondary extends StatelessWidget {
  const InformationListWidgetSecondary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: ConstColor.GreyColor),
        color: ConstColor.WhiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleCategoryWidget(
            icon: Icons.star_outline,
            text: 'Suggested Products',
          ),

          const SizedBox(height: 5),
          DottedLine(
            lineLength: double.infinity,
            lineThickness: 1,
            dashColor: ConstColor.GreyColor,
          ),
          const SizedBox(height: 5),

          SingleCategoryWidget(
            icon: Icons.notifications_outlined,
            text: 'Notifications',
          ),

          const SizedBox(height: 5),
          DottedLine(
            lineLength: double.infinity,
            lineThickness: 1,
            dashColor: ConstColor.GreyColor,
          ),
          const SizedBox(height: 5),

          SingleCategoryWidget(icon: Icons.info_outline, text: 'General Info'),
        ],
      ),
    );
  }
}

class SingleCategoryWidget extends StatelessWidget {
  final IconData? icon;
  final String text;
  const SingleCategoryWidget({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //*for icon and TExt
          Row(
            children: [
              Icon(icon, color: ConstColor.BlackColor, size: 24),
              const SizedBox(width: 5),

              Text(
                text,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: ConstColor.BlackColor,
                ),
              ),
            ],
          ),
          Icon(Icons.keyboard_arrow_right, size: 24),
        ],
      ),
    );
  }
}
