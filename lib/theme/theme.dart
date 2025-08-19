import 'package:flutter/material.dart';
import 'package:grocceryplus/theme/const_color.dart';

final ThemeData apptheme = ThemeData(
  scaffoldBackgroundColor: ConstColor.ScaffoldBackgroundColor,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      // splash
      color: Color(0xFF37474F),
      fontSize: 29,
      fontWeight: FontWeight.w500,
    ),
    displayMedium: TextStyle(
      // product quantity
      color: Color(0xFF3E3E3E),
      fontSize: 29,
      fontWeight: FontWeight.w700,
    ),
    displaySmall: TextStyle(
      // product price
      color: Color(0xFF5EC401),
      fontSize: 29,
      fontWeight: FontWeight.w700,
    ),
    headlineLarge: TextStyle(
      // home title
      color: Color(0xFF37474F),
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    headlineMedium: TextStyle(
      // category title
      color: Color(0xFF37474F),
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: TextStyle(
      // product detail title
      color: Color(0xFF37474F),
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    titleLarge: TextStyle(
      // product name
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    titleMedium: TextStyle(
      // final price
      color: Color(0xFFF37A20),
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    titleSmall: TextStyle(
      // search text field
      color: Color(0xFF37474F),
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    bodyLarge: TextStyle(
      // product description
      color: Color(0xFF3E3E3E),
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: TextStyle(
      // location text
      color: Color(0xFF37474F),
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    bodySmall: TextStyle(
      // category display text
      color: Color(0xFF37474F),
      fontSize: 13,
      fontWeight: FontWeight.w500,
    ),
    labelLarge: TextStyle(
      // add to bag button
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    labelMedium: TextStyle(
      // your location heading
      color: Color(0xFF37474F),
      fontSize: 11,
      fontWeight: FontWeight.w400,
    ),
    labelSmall: TextStyle(
      // original price (cut)
      color: Color(0x8A37474F), // 54% opacity of #37474F
      fontSize: 14,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.lineThrough,
    ),
  ),
);
