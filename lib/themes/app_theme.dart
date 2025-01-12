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
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: black,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      bodyLarge: TextStyle(
        color: black,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: white,
      ),
    ),
    primaryColor: primaryColor,
    scaffoldBackgroundColor: lightBackgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: lightBackgroundColor,
      foregroundColor: black,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: black,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle:
          TextStyle(fontSize: 16, color: gray, fontWeight: FontWeight.w500),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
        borderSide: BorderSide(width: 1.0, color: AppTheme.gray),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
        borderSide: BorderSide(width: 1.0, color: AppTheme.gray),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
        borderSide: BorderSide(width: 1.0, color: AppTheme.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
        borderSide: BorderSide(width: 1.0, color: AppTheme.red),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        backgroundColor: primaryColor,
        foregroundColor: white,
        textStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        minimumSize: const Size(double.infinity, 56),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: primaryColor,
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
          fontStyle: FontStyle.italic,
        ),
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData();
}
