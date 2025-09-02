import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:grocceryplus/models/products_model.dart';

class CartController extends GetxController {
  final cartItemList = <ProductsModel, int>{}.obs;

  //*Add to Cart

  void addtoCart(ProductsModel products, {int quantity = 1}) {
    try {
      // if (cartItemList.containsKey(products)) {
      //   cartItemList[products] = (cartItemList[products] ?? 0) + quantity;
      // } else {
      cartItemList[products] = quantity;
      // }
    } catch (e) {
      Get.snackbar('Exception Occured Cannot perform Add to Cart', '$e');
    }
  }

  //*Remove from Cart

  void removeFromCart(ProductsModel products) {
    try {
      if (cartItemList.containsKey(products)) {
        if ((cartItemList[products] ?? 0) > 1) {
          cartItemList[products] = (cartItemList[products] ?? 0) - 1;
        }
      } else {
        cartItemList.remove(products);
      }
    } catch (e) {
      Get.snackbar('Exception Occured Cannot Perform Remove from Cart', '$e');
    }
  }

  //*Inc Quantity

  void incrementProductQuantity(ProductsModel product) {
    try {
      if (cartItemList.containsKey(product)) {
        cartItemList[product] = (cartItemList[product] ?? 0) + 1;
      }
    } catch (e) {
      debugPrint('Exception Occured Cannot Perform Increment Quantity ');
    }
  }

  //*Decrement Quantity

  void decrementProductQuantity(ProductsModel product) {
    try {
      if (cartItemList.containsKey(product)) {
        if ((cartItemList[product] ?? 0) > 1) {
          cartItemList[product] = (cartItemList[product] ?? 0) - 1;
        } else {
          cartItemList.remove(product);
        }
      }
    } catch (e) {
      debugPrint('Exception Occured Cannot Perform Increment Quantity ');
    }
  }

  //*Get Total cost

  double get totalCost {
    double totalCost = 0.0;
    cartItemList.forEach((product, qty) {
      totalCost += (product.Product_price * qty) + 50;
    });
    return totalCost;
  }

  //*Get Total Quanitity

  double get totalQuantity {
    int totalQuantity = 0;
    cartItemList.forEach((product, qty) {
      totalQuantity += qty;
    });
    return totalQuantity.toDouble();
  }
}
