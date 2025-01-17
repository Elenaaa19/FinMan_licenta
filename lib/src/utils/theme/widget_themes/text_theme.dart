import 'package:flutter/material.dart';

class TTextTheme {
  static TextTheme lightText = TextTheme(
    titleLarge: TextStyle(
      fontSize: 50,
      fontWeight: FontWeight.bold,
      color: Color(0xFF2d8da2),
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
    ),
    labelLarge: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
    ),
  );

  static TextTheme darkText = TextTheme(
    titleLarge: TextStyle(
      fontSize: 50,
      fontWeight: FontWeight.bold,
      color: Color(0xFFFF9900),
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      color: Colors.white,
    ),
    labelLarge: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  );
}