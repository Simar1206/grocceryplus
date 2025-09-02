import 'package:flutter/material.dart';
import 'package:grocceryplus/Screens/cart/widgets/select_date_and_time_widget.dart';
import 'package:grocceryplus/theme/const_color.dart';

class DateSelectorWidget extends StatefulWidget {
  const DateSelectorWidget({super.key});

  @override
  State<DateSelectorWidget> createState() => _DateSelectorWidgetState();
}

class _DateSelectorWidgetState extends State<DateSelectorWidget> {
  bool isClicked = false;

  final List<String> times = [
    "8 AM - 11 AM",
    "11 AM - 12 PM",
    "12 PM - 2 PM",
    "2 PM - 4 PM",
    "4 PM - 6 PM",
    "6 PM - 8 PM",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isClicked = !isClicked;
            });
          },
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ConstColor.GreyColor.withValues(alpha: 0.15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Icon(Icons.date_range_rounded, size: 24),
                    SizedBox(width: 10),
                    Text(
                      'Select Date',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: ConstColor.normalBlack,
                      ),
                    ),
                  ],
                ),
                Icon(
                  isClicked
                      ? Icons.keyboard_arrow_up_outlined
                      : Icons.keyboard_arrow_down_outlined,
                  color: ConstColor.BlackColor,
                  size: 24,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        AnimatedCrossFade(
          firstCurve: Curves.easeOut,
          secondCurve: Curves.easeIn,
          //sizeCurve: Curves.bounceOut,
          duration: const Duration(milliseconds: 500),
          crossFadeState: isClicked
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          firstChild: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              mainAxisExtent: 60,
            ),
            itemCount: times.length,
            itemBuilder: (context, index) {
              return SelectDateAndTimeWidget(setTime: times[index]);
            },
          ),
          secondChild: const SizedBox.shrink(),
        ),
      ],
    );
  }
}
