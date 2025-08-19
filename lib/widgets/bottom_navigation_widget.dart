import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:grocceryplus/Screens/cart/my_bag.dart';
import 'package:grocceryplus/Screens/category/category_page.dart';
import 'package:grocceryplus/Screens/home/homepage.dart';
import 'package:grocceryplus/Screens/settings/settings_page.dart';
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
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(

      () => Container(
        color: ConstColor.WhiteColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
          child: GNav(
            gap: 8,
            backgroundColor: ConstColor.WhiteColor,
            color: Colors.grey.shade700,
            activeColor: ConstColor.WhiteColor,
            tabBackgroundColor: ConstColor.DailyPlusGreen,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            selectedIndex: navigationController.selectedValue.value,
            onTabChange: (index) {
              navigationController.selectedValue.value = index;
              Get.off(ScreensList[index]);
            },
            tabs: const [
              GButton(icon: Icons.home_outlined, text: "Home"),
              GButton(icon: Icons.category_outlined, text: "Categories"),
              GButton(icon: Icons.shopping_bag_outlined, text: "Bag"),
              GButton(icon: Icons.menu_outlined, text: "Menu"),
            ],
          ),
        ),
      ),



      // () => NavigationBar(
      //   //indicatorShape:
      //   indicatorColor: ConstColor.DailyPlusGreen,

      //   maintainBottomViewPadding: false,

      //   backgroundColor: ConstColor.WhiteColor,
      //   elevation: 0,

      //   //height: 60,
      //   selectedIndex: navigationController.selectedValue.value,
      //   onDestinationSelected: (index) {
      //     navigationController.selectedValue.value = index;
      //     Get.off(ScreensList[index]);
      //   },
      //   destinations: [
      //     NavigationDestination(
      //       icon: Icon(Icons.home_outlined, size: 25),

      //       selectedIcon: Icon(
      //         Icons.home_outlined,
      //         size: 25,
      //         color: ConstColor.WhiteColor,
      //       ),

      //       label: 'Home',
      //     ),
      //     NavigationDestination(
      //       icon: Icon(Icons.category_outlined, size: 25),

      //       selectedIcon: Icon(
      //         Icons.category_outlined,
      //         size: 25,
      //         color: ConstColor.WhiteColor,
      //       ),

      //       label: 'Categories',
      //     ),
      //     NavigationDestination(
      //       icon: Icon(Icons.shopping_bag_outlined, size: 25),

      //       selectedIcon: Icon(
      //         Icons.shopping_bag_outlined,
      //         size: 25,
      //         color: ConstColor.WhiteColor,
      //       ),

      //       label: 'Bag',
      //     ),
      //     NavigationDestination(
      //       icon: Icon(Icons.menu_outlined, size: 25),

      //       selectedIcon: Icon(
      //         Icons.menu_outlined,
      //         size: 25,
      //         color: ConstColor.WhiteColor,
      //       ),

      //       label: 'Menu',
      //     ),
      //   ],
      // ),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedValue = 0.obs;
}
