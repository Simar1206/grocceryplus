import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocceryplus/Screens/settings/widgets/back_button_widget.dart';
import 'package:grocceryplus/Screens/settings/widgets/cash_gift_card_widget.dart';
import 'package:grocceryplus/Screens/settings/widgets/horizontal_tabar_widget.dart';
import 'package:grocceryplus/Screens/settings/widgets/information_list_widget.dart';
import 'package:grocceryplus/Screens/settings/widgets/logout_button_widget.dart';
import 'package:grocceryplus/Screens/settings/widgets/profile_widget.dart';
import 'package:grocceryplus/theme/const/responsive.dart';
import 'package:grocceryplus/theme/const_color.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});

  User? usr = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstColor.WhiteColor,
        elevation: 0,
        leading: BackButtonWidget(),
        title: Text(
          'Settings',
          style: TextStyle(
            fontSize: Responsive.fs(0.046),
            fontWeight: FontWeight.w600,
            color: ConstColor.mediumBlack,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Responsive.w(0.037)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //*profile
              ProfileWidget(
                Phone_number: usr!.phoneNumber,
                user_name: usr!.displayName,
              ),
              SizedBox(height: Responsive.h(0.021)),
              //* ListView blocks
              HorizontalTabarWidget(),
              SizedBox(height: Responsive.h(0.021)),
              //giftCard
              CashGiftCardWidget(),

              SizedBox(height: Responsive.h(0.01)),

              //information Panel:
              Text(
                'Your Information',
                style: TextStyle(
                  fontSize: Responsive.fs(0.034),
                  fontWeight: FontWeight.w600,
                  color: ConstColor.BlackColor,
                ),
              ),
              SizedBox(height: Responsive.h(0.005)),
              
              InformationListWidget(),

              SizedBox(height: Responsive.h(0.01)),

              //Secondary information Panel:
              Text(
                'Other Information',
                style: TextStyle(
                  fontSize: Responsive.fs(0.034),
                  fontWeight: FontWeight.w600,
                  color: ConstColor.BlackColor,
                ),
              ),
              SizedBox(height: Responsive.h(0.005)),
              InformationListWidgetSecondary(),

              SizedBox(height: Responsive.h(0.021)),

              //*logout Button:
              LogoutButtonWidget(),

              SizedBox(height: Responsive.h(0.021)),
            ],
          ),
        ),
      ),
    );
  }
}
