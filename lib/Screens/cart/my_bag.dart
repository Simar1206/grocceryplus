import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocceryplus/Screens/cart/cart_controller.dart';
import 'package:grocceryplus/Screens/cart/widgets/date_selector_widget.dart';
import 'package:grocceryplus/Screens/cart/widgets/delivery_location_selector.dart';
import 'package:grocceryplus/Screens/cart/widgets/payment_info_screen.dart';
import 'package:grocceryplus/Screens/cart/widgets/product_added_to_cart_widget.dart';
import 'package:grocceryplus/Screens/cart/widgets/select_date_and_time_widget.dart';
import 'package:grocceryplus/Screens/home/homepage.dart';
import 'package:grocceryplus/Screens/products/widgets/discription_widget.dart';
import 'package:grocceryplus/Screens/products/widgets/highlights_widget.dart';
import 'package:grocceryplus/Screens/products/widgets/rounded_icon_widget.dart';
import 'package:grocceryplus/theme/const_color.dart';
import 'package:grocceryplus/widgets/action_button_widget.dart';
import 'package:grocceryplus/widgets/bottom_navigation_widget.dart';

class MyBag extends StatefulWidget {
  MyBag({super.key});

  @override
  State<MyBag> createState() => _MyBagState();
}

class _MyBagState extends State<MyBag> {
  CartController cartController = Get.find<CartController>();
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: BottomNavigationWidget(),
      appBar: AppBar(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(20),
        ),
        leading: CircularAvatarWidget(
          icon: Icons.arrow_back_ios_new,
          color: ConstColor.BlackColor,
          iconPress: () {
            //TODO: Navigate back to homepage
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Cart',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(17.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //*Text
              Text(
                "Products",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),

              SizedBox(height: 10),

              Obx(() {
                final productsInCart = cartController.cartItemList.keys
                    .toList();

                if (productsInCart.isEmpty) {
                  return Center(
                    child: Text(
                      'Your cart is empty!',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  );
                }

                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: productsInCart.length,
                  itemBuilder: (context, index) {
                    final product = productsInCart[index];
                    return ProductAddedToCartWidget(product: product);
                  },
                );
              }),

              SizedBox(height: 28),

              //* Add More Button
              ActionButtonWidgetWOpadding(
                onPress: () {
                  //TODO Navigate to the Homepage:

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Homepage()),
                  );
                },
                ButtonText: "Add More Products",
                icon: null,
              ),

              // ActionButtonWidget(
              //   onPress: () {
              //     //TODO Navigate to the Homepage:

              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => Homepage()),
              //     );
              //   },
              //   ButtonText: "Add More Products",
              //   icon: null,
              // ),
              SizedBox(height: 48),

              //*Expected Date and Time:
              Text(
                "Expected Date & TIme",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 20),

              DateSelectorWidget(),

              SizedBox(height: 20),

              DeliveryLocationSelector(),

              SizedBox(height: 20),

              PaymentInfoScreen(),

              SizedBox(height: 30),
              Text(
                "Payment Method",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 15),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ConstColor.WhiteColor,
                ),
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ConstColor.DailyPlusGreen.withValues(alpha: 0.15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //*button + title:
                      Expanded(
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: ConstColor.DarkGreenColor,
                              foregroundColor: ConstColor.WhiteColor,
                              child: Text("\$", style: TextStyle(fontSize: 20),),
                            ),
                            SizedBox(width: 14),
                            Expanded(
                              child: Text(
                                "Tap Here to select your \nPayment Method",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: ConstColor.BlackColor,
                        size: 24,
                      ),
                    ],
                  ),
                ),
              ),

              //*end sizeBOx
              SizedBox(height: 500),
            ],
          ),
        ),
      ),
    );
  }
}
