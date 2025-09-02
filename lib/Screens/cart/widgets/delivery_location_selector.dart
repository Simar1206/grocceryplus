import 'package:flutter/material.dart';
import 'package:grocceryplus/Screens/products/widgets/rounded_icon_widget.dart';
import 'package:grocceryplus/theme/const_color.dart';
import 'package:grocceryplus/widgets/double_container_background_widget.dart';

class DeliveryLocationSelector extends StatelessWidget {
  const DeliveryLocationSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //*title + change option
            Text(
              "Delivery Location",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Text(
              "Change",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: ConstColor.DailyPlusGreen,
              ),
            ),
          ],
        ),
        SizedBox(height: 20),

        DoubleContainerBackgroundWidget(
          widgetUsed: Row(
            children: [
              CircularAvatarWidget(
                icon: Icons.location_on_outlined,
                color: ConstColor.BlackColor,
                iconPress: () {},
              ),

              SizedBox(width: 16),

              Expanded(
                child: Text(
                  "Floor 4, Wakil Tower, Ta 131 Gulshan Badda Link Road",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
