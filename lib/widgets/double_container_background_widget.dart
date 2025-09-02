import 'package:flutter/material.dart';
import 'package:grocceryplus/theme/const_color.dart';

class DoubleContainerBackgroundWidget extends StatelessWidget {
  final Widget widgetUsed;
  const DoubleContainerBackgroundWidget({super.key, required this.widgetUsed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ConstColor.WhiteColor,
      ),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ConstColor.shadowColor,
        ),
        child: widgetUsed,
      ),
    );
  }
}
