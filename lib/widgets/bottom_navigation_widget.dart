import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:grocceryplus/Screens/cart/my_bag.dart';
import 'package:grocceryplus/Screens/category/category_page.dart';
import 'package:grocceryplus/Screens/home/homepage.dart';
import 'package:grocceryplus/Screens/settings/settings_page.dart';
import 'package:grocceryplus/theme/const/responsive.dart';
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
          padding: EdgeInsets.symmetric(
            horizontal: Responsive.w(0.02),
            vertical: Responsive.h(0.02),
          ),
          child: GNav(
            gap: Responsive.w(0.02),
            backgroundColor: ConstColor.WhiteColor,
            color: Colors.grey.shade700,
            activeColor: ConstColor.WhiteColor,
            tabBackgroundColor: ConstColor.DailyPlusGreen,
            padding: EdgeInsets.symmetric(
              horizontal: Responsive.w(0.02),
              vertical: Responsive.w(0.02),
            ),
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
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedValue = 0.obs;
}
