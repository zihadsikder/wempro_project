import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle titleStyle(
      {Color color = Colors.black, double fontSize = 18}) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: color,
      //letterSpacing: 1.7,
      height: 1.5,
    );
  }

  static TextStyle headerStyle({Color color = Colors.black}) {
    return TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: color,
        height: 1.5,
    );
  }

  static TextStyle normalStyle(
      {Color color = Colors.black, double fontSize = 14}) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: fontSize,
      color: color,

    );
  }
}
