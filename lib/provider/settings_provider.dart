import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier {
  ThemeMode darkTheme = ThemeMode.dark;
  String languageCode = 'en';
  bool get getIsDark => darkTheme == ThemeMode.dark;

  void changeTheme() {
    darkTheme = darkTheme == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }

  void changeLanguage(String code) {
    languageCode = code;
    notifyListeners();
  }
}
