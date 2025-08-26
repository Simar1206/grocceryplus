import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:grocceryplus/theme/const/responsive.dart';
import 'package:grocceryplus/theme/const_color.dart';

class CashGiftCardWidget extends StatelessWidget {
  const CashGiftCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Responsive.w(0.018)),
      decoration: BoxDecoration(
        color: ConstColor.DailyPlusGreenLight.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: ConstColor.DailyPlusGreen),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //*icon with text
              Row(
                children: [
                  Icon(
                    Icons.account_balance_wallet_outlined,
                    size: Responsive.w(0.055),
                  ),
                  SizedBox(width: Responsive.w(0.023)),
                  Text(
                    'GroccesyPlus Cash & Gift Card',
                    style: TextStyle(
                      fontSize: Responsive.fs(0.03),
                      color: ConstColor.BlackColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              //button
              Icon(
                Icons.keyboard_arrow_right_sharp,
                color: ConstColor.mediumBlack,
              ),
            ],
          ),

           SizedBox(height: Responsive.w(0.012)),

          DottedLine(
            lineThickness: Responsive.w(0.002),
            lineLength: double.infinity,
            dashColor: ConstColor.DailyPlusGreen,
          ),

           SizedBox(height: Responsive.w(0.015)),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //* balance and add balance
              Row(
                children: [
                  Text(
                    'Available Balance',
                    style: TextStyle(
                      fontSize: Responsive.fs(0.03),
                      color: ConstColor.mediumBlack,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: Responsive.w(0.011)),
                  Text(
                    '\$0',
                    style: TextStyle(
                      fontSize: Responsive.fs(0.034),
                      color: ConstColor.BlackColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              //*add balacnce button:
              Container(
                padding: EdgeInsets.all(Responsive.w(0.023)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: ConstColor.GreyColor),
                  color: ConstColor.WhiteColor,
                ),
                child: Text(
                  'Add Balance',
                  style: TextStyle(
                    fontSize: Responsive.w(0.023),
                    color: ConstColor.BlackColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
