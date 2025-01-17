import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TAppbarTheme {
  static AppBarTheme lightAppbarTheme = AppBarTheme(
    backgroundColor: Color(0xFF2d8da2),
    foregroundColor: Colors.white,
    elevation: 5,
    titleTextStyle: GoogleFonts.sixtyfour(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  );

  static AppBarTheme darkAppbarTheme = AppBarTheme(
    backgroundColor: Color(0xFF009999),
    foregroundColor: Colors.white,
    elevation: 0,
    titleTextStyle: GoogleFonts.sixtyfour(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  );
}