import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier {
  ThemeMode darkTheme = ThemeMode.dark;
  bool get getIsDark => darkTheme == ThemeMode.dark;

  void changeTheme() {
    darkTheme = darkTheme == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}
