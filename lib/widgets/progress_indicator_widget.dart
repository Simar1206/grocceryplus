import 'package:flutter/material.dart';
import 'package:grocceryplus/theme/const_color.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  const ProgressIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: ConstColor.TextfieldBackground,
        backgroundColor: ConstColor.AccentColor,
      ),
    );
  }
}
