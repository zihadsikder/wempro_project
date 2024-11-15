import 'package:flutter/material.dart';

import '../config/app_colors.dart';
import 'app_text_style.dart';


class AppThemeData {
  static ThemeData lightThemeData = ThemeData(
    primaryColor: const Color(0xffc5c7c5),
    primarySwatch: Colors.grey,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.bgColor,
      titleTextStyle: AppTextStyles.headerStyle(),
    ),

    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.bgColor,
      filled: true,
      border: InputBorder.none,

      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(4),
      ),

      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 2, color: AppColors.basicColor),
        borderRadius: BorderRadius.circular(4),
      ),
      hintStyle: TextStyle(
        color: AppColors.hintTextColor,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.bgColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        //padding: const EdgeInsets.symmetric(horizontal: 20),
        textStyle: AppTextStyles.headerStyle(color: AppColors.bgColor),
      ),
    ),
  );
}
