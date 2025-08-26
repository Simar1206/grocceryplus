import 'package:flutter/material.dart';
import 'package:grocceryplus/theme/const/responsive.dart';
import 'package:grocceryplus/theme/const_color.dart';

class HorizontalTabarWidget extends StatelessWidget {
  const HorizontalTabarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SingleListWidget(
          icon: Icons.shopping_bag_outlined,
          text: 'Your\nOrders',
          onPress: () {},
        ),
        SingleListWidget(
          icon: Icons.chat_outlined,
          text: 'Chat With\nUs',
          onPress: () {},
        ),
        SingleListWidget(
          icon: Icons.currency_rupee_outlined,
          text: 'GrocceryPlus\nCash',
          onPress: () {},
        ),
      ],
    );
  }
}

class SingleListWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback? onPress;

  const SingleListWidget({
    super.key,
    required this.icon,
    required this.text,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: Responsive.h(0.1),
        //width: 114,
        margin: EdgeInsets.only(right: Responsive.w(0.027)),
        padding: EdgeInsets.symmetric(vertical: Responsive.w(0.01)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: ConstColor.WhiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: Responsive.w(0.055),
              color: ConstColor.normalBlack,
            ),
            SizedBox(height: Responsive.w(0.01)),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: Responsive.fs(0.03),
                fontWeight: FontWeight.w600,
                color: ConstColor.mediumBlack,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
