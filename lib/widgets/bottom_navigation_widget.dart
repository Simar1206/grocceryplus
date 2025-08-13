import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocceryplus/Screens/cart/my_bag.dart';
import 'package:grocceryplus/Screens/category/category_page.dart';
import 'package:grocceryplus/Screens/home/homepage.dart';
import 'package:grocceryplus/Screens/menu/menu_page.dart';
import 'package:grocceryplus/theme/const_color.dart';

class BottomNavigationWidget extends StatelessWidget {
  BottomNavigationWidget({super.key});

  final NavigationController navigationController = Get.put(
    NavigationController(),
  );

  final List<Widget> ScreensList = [
    Homepage(),
    CategoryPage(),
    MyBag(),
    MenuPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => NavigationBar(
        //indicatorShape:
        indicatorColor: ConstColor.DailyPlusGreen,

        maintainBottomViewPadding: false,

        backgroundColor: ConstColor.WhiteColor,
        elevation: 0,

        //height: 60,
        selectedIndex: navigationController.selectedValue.value,
        onDestinationSelected: (index) {
          navigationController.selectedValue.value = index;
          Get.off(ScreensList[index]);
        },
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home_outlined, size: 25),

            selectedIcon: Icon(
              Icons.home_outlined,
              size: 25,
              color: ConstColor.WhiteColor,
            ),

            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.category_outlined, size: 25),

            selectedIcon: Icon(
              Icons.category_outlined,
              size: 25,
              color: ConstColor.WhiteColor,
            ),

            label: 'Categories',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_bag_outlined, size: 25),

            selectedIcon: Icon(
              Icons.shopping_bag_outlined,
              size: 25,
              color: ConstColor.WhiteColor,
            ),

            label: 'Bag',
          ),
          NavigationDestination(
            icon: Icon(Icons.menu_outlined, size: 25),

            selectedIcon: Icon(
              Icons.menu_outlined,
              size: 25,
              color: ConstColor.WhiteColor,
            ),

            label: 'Menu',
          ),
        ],
      ),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedValue = 0.obs;
}
