import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:grocceryplus/models/products_model.dart';

class CartController extends GetxController {
  final cartItemList = <ProductsModel>[].obs;

  //*Add to Cart

  void addtoCartOrIncrement(ProductsModel products) {
    try {
      // products.selectedQuantity.value = 1;
      // cartItemList.add(products);

      final currentProductIndex = cartItemList.indexWhere(
        //TODO check by unique ID
        (e) => e.Product_Name == products.Product_Name,
      );

      if (currentProductIndex != -1) {
        //*product exist inc quantity:
        cartItemList.elementAt(currentProductIndex).selectedQuantity.value++;
        debugPrint(
          "Product ${products.Product_Name} is increment to ${cartItemList.elementAt(currentProductIndex).selectedQuantity.value}",
        );
      } else {
        //*product == new, add to cart
        products.selectedQuantity.value = 1;
        cartItemList.add(products);
      }
    } catch (e) {
      Get.snackbar('Exception Occured Cannot perform Add to Cart', '$e');
    }
  }

  // //*Remove from Cart

  void removeFromCart(ProductsModel products) {
    try {
      cartItemList.remove(products);
    } catch (e) {
      Get.snackbar('Exception Occured Cannot Perform Remove from Cart', '$e');
    }
  }

  // //*Inc Quantity

  // void increment(int index) {
  //   try {
  //     cartItemList.elementAt(index).selectedQuantity += 1;
  //   } catch (e) {
  //     debugPrint('Exception Occured Cannot Perform Increment Quantity ');
  //   }
  // }

  //*Decrement Quantity

  void decrement(int index) {
    try {
      if (cartItemList.elementAt(index).selectedQuantity.value > 1) {
        cartItemList.elementAt(index).selectedQuantity.value--;
      } else {
        cartItemList.removeAt(index);
      }

      // cartItemList.elementAt(index).selectedQuantity -= 1;
      // if (cartItemList.elementAt(index).selectedQuantity.value < 1) {
      //   cartItemList.remove(cartItemList.elementAt(index));
      // }
    } catch (e) {
      debugPrint('Exception Occured Cannot Perform Increment Quantity ');
    }
  }

  //*Get Total cost

  double get totalCost {
    double totalCost = 0.0;
    cartItemList.forEach((product) {
      totalCost += (product.Product_price * product.selectedQuantity.value);
    });
    if (totalCost < 1) {
      return 0.0;
    } else {
      return totalCost + 50;
    }
    //return totalCost + 50; //*delivery charge
  }

  //*Get Total Quanitity

  double get totalQuantity {
    int totalQuantity = 0;
    cartItemList.forEach((product) {
      totalQuantity += product.selectedQuantity.value;
    });
    return totalQuantity.toDouble();
  }
}
