import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocceryplus/theme/const_color.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/home_page');
      },
      child: Padding(
        padding: EdgeInsetsGeometry.all(10),
        child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: ConstColor.mediumBlack),
          ),
          child: Icon(Icons.arrow_back_ios_new, size: 20),
        ),
      ),
    );
  }
}
