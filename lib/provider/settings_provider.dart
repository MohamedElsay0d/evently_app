import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider with ChangeNotifier {
  late SharedPreferences _sharedPreferences;
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>(); 

  ThemeMode _darkTheme = ThemeMode.dark;
  String _languageCode = 'en';

  ThemeMode get darkTheme => _darkTheme;
  String get languageCode => _languageCode;
  bool get getIsDark => darkTheme == ThemeMode.dark;

  SettingsProvider() {
    initSharedPreference();
  }

  Future<void> initSharedPreference() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    loadSettings();
  }

  Future<void> saveChanges() async {
    await _sharedPreferences.setString('theme', _darkTheme.name);
    await _sharedPreferences.setString('language', _languageCode);
  }

  void loadSettings() {
    final savedTheme = _sharedPreferences.getString('theme') ?? 'dark';
    final savedLanguage = _sharedPreferences.getString('language') ?? 'en';

    switch (savedTheme) {
      case 'light':
        _darkTheme = ThemeMode.light;
        break;
      case 'dark':
        _darkTheme = ThemeMode.dark;
        break;
      default:
        _darkTheme = ThemeMode.dark;
    }
    _languageCode = savedLanguage;
    notifyListeners();
  }

  void changeTheme() {
    _darkTheme = darkTheme == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    saveChanges();
    notifyListeners();
  }

  void changeLanguage(String code) {
    _languageCode = code;
    saveChanges();
    notifyListeners();
  }
}
