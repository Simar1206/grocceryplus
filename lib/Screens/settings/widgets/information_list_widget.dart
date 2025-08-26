import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:grocceryplus/theme/const/responsive.dart';
import 'package:grocceryplus/theme/const_color.dart';

class InformationListWidget extends StatelessWidget {
  const InformationListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Responsive.w(0.023)),
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

          SizedBox(height: Responsive.h(0.005)),

          DottedLine(
            lineLength: double.infinity,
            lineThickness: Responsive.w(0.002),
            dashColor: ConstColor.GreyColor,
          ),
          SizedBox(height: Responsive.h(0.005)),

          SingleCategoryWidget(
            icon: Icons.wallet_outlined,
            text: 'E-Gift Cards',
          ),

          SizedBox(height: Responsive.h(0.005)),
          DottedLine(
            lineLength: double.infinity,
            lineThickness: Responsive.w(0.002),
            dashColor: ConstColor.GreyColor,
          ),
          SizedBox(height: Responsive.h(0.005)),

          SingleCategoryWidget(
            icon: Icons.support_agent_outlined,
            text: 'Help & Support',
          ),

          SizedBox(height: Responsive.h(0.005)),
          DottedLine(
            lineLength: double.infinity,
            lineThickness: Responsive.w(0.002),
            dashColor: ConstColor.GreyColor,
          ),
          SizedBox(height: Responsive.h(0.005)),

          SingleCategoryWidget(
            icon: Icons.currency_rupee_sharp,
            text: 'Refunds',
          ),

          SizedBox(height: Responsive.h(0.005)),
          DottedLine(
            lineLength: double.infinity,
            lineThickness: Responsive.w(0.002),
            dashColor: ConstColor.GreyColor,
          ),
          SizedBox(height: Responsive.h(0.005)),

          SingleCategoryWidget(
            icon: Icons.location_on_outlined,
            text: 'Saved Addresses',
          ),

          SizedBox(height: Responsive.h(0.005)),
          DottedLine(
            lineLength: double.infinity,
            lineThickness: Responsive.w(0.002),
            dashColor: ConstColor.GreyColor,
          ),
          SizedBox(height: Responsive.h(0.005)),

          SingleCategoryWidget(icon: Icons.person_2_outlined, text: 'Profile'),

          SizedBox(height: Responsive.h(0.005)),
          DottedLine(
            lineLength: double.infinity,
            lineThickness: Responsive.w(0.002),
            dashColor: ConstColor.GreyColor,
          ),
          SizedBox(height: Responsive.h(0.005)),

          SingleCategoryWidget(
            icon: Icons.card_giftcard_outlined,
            text: 'Rewards',
          ),

          SizedBox(height: Responsive.h(0.005)),
          DottedLine(
            lineLength: double.infinity,
            lineThickness: Responsive.w(0.002),
            dashColor: ConstColor.GreyColor,
          ),
          SizedBox(height: Responsive.h(0.005)),

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
      padding: EdgeInsets.all(Responsive.w(0.023)),
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

          SizedBox(height: Responsive.h(0.005)),
          DottedLine(
            lineLength: double.infinity,
            lineThickness: Responsive.w(0.002),
            dashColor: ConstColor.GreyColor,
          ),
          SizedBox(height: Responsive.h(0.005)),

          SingleCategoryWidget(
            icon: Icons.notifications_outlined,
            text: 'Notifications',
          ),

          SizedBox(height: Responsive.h(0.005)),
          DottedLine(
            lineLength: double.infinity,
            lineThickness: Responsive.w(0.002),
            dashColor: ConstColor.GreyColor,
          ),
          SizedBox(height: Responsive.h(0.005)),

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
      padding: EdgeInsets.all(Responsive.w(0.018)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //*for icon and TExt
          Row(
            children: [
              Icon(
                icon,
                color: ConstColor.BlackColor,
                size: Responsive.w(0.055),
              ),

              SizedBox(width: Responsive.w(0.011)),

              Text(
                text,
                style: TextStyle(
                  fontSize: Responsive.fs(0.027),
                  fontWeight: FontWeight.w500,
                  color: ConstColor.BlackColor,
                ),
              ),
            ],
          ),
          Icon(Icons.keyboard_arrow_right, size: Responsive.w(0.055)),
        ],
      ),
    );
  }
}
