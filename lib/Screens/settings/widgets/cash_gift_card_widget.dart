import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:grocceryplus/theme/const_color.dart';

class CashGiftCardWidget extends StatelessWidget {
  const CashGiftCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
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
                  Icon(Icons.account_balance_wallet_outlined, size: 24),
                  const SizedBox(width: 10),
                  Text(
                    'GroccesyPlus Cash & Gift Card',
                    style: TextStyle(
                      fontSize: 13,
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

          const SizedBox(height: 12),

          DottedLine(
            lineThickness: 1,
            lineLength: double.infinity,
            dashColor: ConstColor.DailyPlusGreen,
          ),

          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //* balance and add balance
              Row(
                children: [
                  Text(
                    'Available Balance',
                    style: TextStyle(
                      fontSize: 13,
                      color: ConstColor.mediumBlack,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    '\$0',
                    style: TextStyle(
                      fontSize: 15,
                      color: ConstColor.BlackColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              //*add balacnce button:
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: ConstColor.GreyColor),
                  color: ConstColor.WhiteColor,
                ),
                child: Text(
                  'Add Balance',
                  style: TextStyle(
                    fontSize: 10,
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
