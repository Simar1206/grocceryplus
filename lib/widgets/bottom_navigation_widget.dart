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

  final NavigationController navigationController =
      Get.find<NavigationController>();

  final List<Widget> screensList = [
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
            vertical: Responsive.h(0.025),
          ),
          child: GNav(
            gap: Responsive.w(0.02),
            backgroundColor: ConstColor.WhiteColor,
            color: Colors.grey.shade700,
            activeColor: ConstColor.WhiteColor,
            tabBackgroundColor: ConstColor.DailyPlusGreen,
            padding: EdgeInsets.symmetric(
              horizontal: Responsive.w(0.04),
              vertical: Responsive.w(0.025),
            ),
            selectedIndex: navigationController.selectedIndex.value,
            onTabChange: (index) {
              navigationController.selectedIndex.value = index;
              Get.off(screensList[index]);
              print(
                " the index for bottom nav bar is: ${navigationController.selectedIndex.value}",
              );
            },
            tabs: const [
              GButton(
                icon: Icons.home_outlined,
                text: "Home",
                iconSize: 30,
                haptic: true,
              ),
              GButton(
                icon: Icons.category_outlined,
                text: "Categories",
                iconSize: 30,
                haptic: true,
              ),
              GButton(
                icon: Icons.shopping_bag_outlined,
                text: "Bag",
                iconSize: 30,
                haptic: true,
              ),
              GButton(
                icon: Icons.menu_outlined,
                text: "Menu",
                iconSize: 30,
                haptic: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavigationController extends GetxController {
  final selectedIndex = 0.obs;
}
