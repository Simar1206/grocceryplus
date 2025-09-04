import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocceryplus/Screens/payment/payment_options_screen.dart';
import 'package:grocceryplus/controller/cart_controller.dart';
import 'package:grocceryplus/Screens/cart/widgets/date_selector_widget.dart';
import 'package:grocceryplus/Screens/cart/widgets/delivery_location_selector.dart';
import 'package:grocceryplus/Screens/cart/widgets/payment_info_screen.dart';
import 'package:grocceryplus/Screens/cart/widgets/product_added_to_cart_widget.dart';
import 'package:grocceryplus/Screens/home/homepage.dart';
import 'package:grocceryplus/Screens/products/widgets/rounded_icon_widget.dart';
import 'package:grocceryplus/theme/const_color.dart';
import 'package:grocceryplus/widgets/action_button_widget.dart';
import 'package:grocceryplus/widgets/bottom_navigation_widget.dart';
import 'package:grocceryplus/widgets/reactive_button_for_payment.dart';

class MyBag extends StatefulWidget {
  const MyBag({super.key});

  @override
  State<MyBag> createState() => _MyBagState();
}

class _MyBagState extends State<MyBag> {
  //*Getx controllers:
  final CartController cartController = Get.find<CartController>();
  final NavigationController navigationController =
      Get.find<NavigationController>();

  bool isClicked = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigationController.selectedIndex.value = 2;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    navigationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: cartController.cartItemList.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: ReactiveButtonForPayment(
                onPress: () {
                  cartController.cartItemList.isNotEmpty
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PaymentOptionsScreen(),
                          ),
                        )
                      : Get.snackbar("Add items to the Cart First", "");
                },
                icon: null,
              ),
            )
          : const SizedBox.shrink(),
      bottomNavigationBar: BottomNavigationWidget(),

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
                final productsInCart = cartController.cartItemList.toList();

                if (productsInCart.isEmpty) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shopping_cart_outlined,
                        size: 24,
                        color: Colors.pink,
                      ),

                      SizedBox(width: 10),
                      Text(
                        'Your cart is empty!',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ],
                  );
                }

                return ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: productsInCart.length,
                  itemBuilder: (context, index) {
                    final product = productsInCart[index];
                    return Dismissible(
                      //TODO change name to unique ID
                      key: Key(product.Product_Name),

                      direction: DismissDirection.endToStart,

                      background: Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),

                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Icon(
                          Icons.delete_outline_rounded,
                          color: Colors.white,
                        ),
                      ),

                      onDismissed: (direction) {
                        cartController.removeFromCart(product);
                      },

                      child: ProductAddedToCartWidget(
                        product: product,
                        index: index,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(height: 15),
                );
              }),

              SizedBox(height: 28),

              //* Add More Button
              ActionButtonWidgetWOpadding(
                onPress: () async {
                  //TODO Navigate to the Homepage:

                  await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Homepage()),
                  );
                },
                ButtonText: "Add More Products",
                icon: null,
              ),

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
                              child: Text("\$", style: TextStyle(fontSize: 20)),
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
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
