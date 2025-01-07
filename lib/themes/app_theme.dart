import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF5669FF);
  static const Color lightBackgroundColor = Color(0xFFF2FEFF);
  static const Color darkBackgroundColor = Color(0xFF101127);
  static const Color black = Color(0xFF1C1C1C);
  static const Color gray = Color(0xFF7B7B7B);
  static const Color white = Color(0xFFFFFFFF);
  static const Color red = Color(0xFFFF5659);

  static ThemeData lightTheme = ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: lightBackgroundColor,
      appBarTheme: const AppBarTheme(
          backgroundColor: lightBackgroundColor,
          foregroundColor: black,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: primaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          )));
  static ThemeData darkTheme = ThemeData();
}
