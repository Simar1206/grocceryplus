import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocceryplus/controller/cart_controller.dart';
import 'package:grocceryplus/widgets/double_container_background_widget.dart';

class PaymentInfoScreen extends StatelessWidget {
  final CartController cartController = Get.find<CartController>();
  PaymentInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DoubleContainerBackgroundWidget(
        widgetUsed: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Products",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                Text(
                  cartController.totalQuantity.toString(),
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Delivery Charge",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                Text(
                  cartController.cartItemList.isNotEmpty ? "\$50.0" : "\$0.0",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
                Text(
                  "\$${cartController.totalCost.toString()}",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
