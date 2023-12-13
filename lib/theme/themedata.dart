import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colorpalatt.dart';

class AppThemeData {
  static ThemeData appTheme = ThemeData(
      primaryColor: Palatt.primary,
      fontFamily: AppFontFamily.family,
      appBarTheme: const AppBarTheme(
        backgroundColor: Palatt.white,
        foregroundColor: Palatt.black,
        elevation: 2,
      ));
}

class AppFontFamily {
  static get family => GoogleFonts.hind().fontFamily;
}

TextStyle googleFontstyle(TextStyle style) => GoogleFonts.hind(
      fontSize: style.fontSize,
      height: style.height,
      color: style.color,
      fontWeight: style.fontWeight,
    );
