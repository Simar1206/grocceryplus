import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocceryplus/Screens/payment/widgets/add_new_card_widget.dart';
import 'package:grocceryplus/Screens/payment/widgets/payment_options_list_tile_widget.dart';
import 'package:grocceryplus/Screens/products/widgets/rounded_icon_widget.dart';
import 'package:grocceryplus/Screens/settings/widgets/information_list_widget.dart';
import 'package:grocceryplus/controller/cart_controller.dart';
import 'package:grocceryplus/theme/const_color.dart';

class PaymentOptionsScreen extends StatelessWidget {
  const PaymentOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //* GETX controller
    CartController cartController = Get.find<CartController>();

    return Scaffold(
      appBar: AppBar(
        leading: CircularAvatarWidget(
          icon: Icons.keyboard_arrow_left,
          color: ConstColor.BlackColor,
          iconPress: () {
            Navigator.pop(context);
          },
        ),

        elevation: 5,
        backgroundColor: ConstColor.WhiteColor,

        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Payment Options",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 5),
            Text(
              "Delivering to: Floor 4, Wakil Tower, Ta 131 Gulshan Badda Link Road ",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: ConstColor.mediumBlack,
              ),
            ),
          ],
        ),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, InnerboxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: ConstColor.shadowColor,
              forceElevated: true,
              shadowColor: ConstColor.BlackColor,
              automaticallyImplyLeading: false,

              elevation: 5,
              pinned: true,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(10),
              ),

              //toolbarHeight: 100,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //TODO Implement Location
                  SizedBox(height: 10),

                  Row(
                    children: [
                      Text(
                        "To Pay : ",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "\$${cartController.totalCost}",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.pink,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ];
        },
        body: Padding(
          padding: EdgeInsetsGeometry.all(16),
          child: ListView(
            children: [
              Text(
                "Pay by UPI: ",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: ConstColor.BlackColor,
                ),
              ),

              SizedBox(height: 10),

              PaymentOptionsListTileWidget(
                img: "assets/images/UPI.png",
                title: "Pay by any UPI app",
                subtitle: "Use any UPI app on the phone to pay",
                icon: Icons.keyboard_arrow_right_rounded,
              ),

              SizedBox(height: 10),

              Text(
                "Pay by RazorPay",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: ConstColor.BlackColor,
                ),
              ),

              SizedBox(height: 10),

              PaymentOptionsListTileWidget(
                title: "Pay with RazorPay",
                img: "assets/images/razorpayimg.png",
                subtitle: "Use Razorpay for Fast and secure Payment",
              ),

              SizedBox(height: 10),

              Text(
                "Pluxee",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: ConstColor.BlackColor,
                ),
              ),

              SizedBox(height: 10),

              AddNewCardWidget(title: "Add new Pluxee Card"),

              SizedBox(height: 10),

              Text(
                "Credit & Debit Cards",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: ConstColor.BlackColor,
                ),
              ),

              SizedBox(height: 10),

              AddNewCardWidget(
                title: "Add new Card",
                subtitle: "Visa, Mastercard, Rupay & More",
              ),

              SizedBox(height: 10),

              Text(
                "Pay Later",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: ConstColor.BlackColor,
                ),
              ),

              SizedBox(height: 10),

              PaymentOptionsListTileWidget(
                img: "assets/images/simpl pay.png",
                title: "Simpl",
              ),
              PaymentOptionsListTileWidget(
                img: "assets/images/lazy pay",
                title: "LazyPay",
              ),
              PaymentOptionsListTileWidget(
                img: "assets/images/amazonpay.png",
                title: "Amazon Pay Later",
              ),

              SizedBox(height: 10),

              Text(
                "Wallets",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: ConstColor.BlackColor,
                ),
              ),

              SizedBox(height: 10),

              PaymentOptionsListTileWidget(
                img: "assets/images/phonepay.png",
                title: "PhonePe Wallet",
              ),
              PaymentOptionsListTileWidget(
                img: "assets/images/amazonpay.png",
                title: "Amazon Pay Balance",
              ),

              SizedBox(height: 10),

              Text(
                "NetBanking",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: ConstColor.BlackColor,
                ),
              ),

              SizedBox(height: 10),

              PaymentOptionsListTileWidget(
                img: "assets/images/hdfc.png",
                title: "HDFC Bank",
              ),
              PaymentOptionsListTileWidget(
                img: "assets/images/icici.png",
                title: "ICICI Bank",
              ),
              PaymentOptionsListTileWidget(
                img: "assets/images/sbi.png",
                title: "SBI",
              ),
              PaymentOptionsListTileWidget(
                img: "assets/images/axis.png",
                icon: Icons.balance,
                title: "Axis",
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
