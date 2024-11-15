import 'package:flutter/material.dart';

class AppColors {
  static Color primaryColor = Colors.grey;
  static Gradient appGradient = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xff86b560), Color(0xff336f4a)],
  );
  static Color bgColor = const Color(0xffffffff);
  static Color screenBgColor = Colors.grey.shade100;
  static Color hintTextColor = const Color(0xffada9a9);
  static Color basicColor = const Color(0xff878585);
}
