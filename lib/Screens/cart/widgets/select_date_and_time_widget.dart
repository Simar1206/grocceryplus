import 'package:flutter/material.dart';
import 'package:grocceryplus/theme/const_color.dart';

class SelectDateAndTimeWidget extends StatefulWidget {
  final String setTime;
  const SelectDateAndTimeWidget({super.key, required this.setTime});

  @override
  State<SelectDateAndTimeWidget> createState() =>
      _SelectDateAndTimeWidgetState();
}

class _SelectDateAndTimeWidgetState extends State<SelectDateAndTimeWidget> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //TODO Toggle Set And Unset
        setState(() {
          isClicked = !isClicked;
        });
      },
      child: Container(
        // height: 55,
        // width: 105,
        //margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 2,
            color: isClicked
                ? ConstColor.DailyPlusGreen
                : ConstColor.shadowColor,
          ),
          color: ConstColor.GreyColor.withValues(alpha: 0.15),
        ),
        child: Center(
          child: Text(
            widget.setTime,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: isClicked
                  ? ConstColor.DailyPlusGreen
                  : ConstColor.normalBlack,
            ),
          ),
        ),
      ),
    );
  }
}
