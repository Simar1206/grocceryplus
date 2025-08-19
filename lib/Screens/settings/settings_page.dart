import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocceryplus/Screens/settings/widgets/back_button_widget.dart';
import 'package:grocceryplus/Screens/settings/widgets/cash_gift_card_widget.dart';
import 'package:grocceryplus/Screens/settings/widgets/horizontal_tabar_widget.dart';
import 'package:grocceryplus/Screens/settings/widgets/information_list_widget.dart';
import 'package:grocceryplus/Screens/settings/widgets/logout_button_widget.dart';
import 'package:grocceryplus/Screens/settings/widgets/profile_widget.dart';
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
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: ConstColor.mediumBlack,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //*profile
              ProfileWidget(
                Phone_number: usr!.phoneNumber,
                user_name: usr!.displayName,
              ),
              const SizedBox(height: 20),
              //* ListView blocks
              HorizontalTabarWidget(),
              const SizedBox(height: 20),
              //giftCard
              CashGiftCardWidget(),

              const SizedBox(height: 10),

              //information Panel:
              Text(
                'Your Information',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: ConstColor.BlackColor,
                ),
              ),
              const SizedBox(height: 5),
              InformationListWidget(),

              const SizedBox(height: 10),

              //Secondary information Panel:
              Text(
                'Other Information',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: ConstColor.BlackColor,
                ),
              ),
              const SizedBox(height: 5),
              InformationListWidgetSecondary(),

              const SizedBox(height: 20,),

              //*logout Button:
             LogoutButtonWidget(),

             const SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
