import 'dark_mode.dart';
import 'package:anna_sakkoa/themes/light_mode.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themedata = lightMode;

  ThemeData get themedata => _themedata;

  bool get isDarkMode => _themedata == darkMode;

  set themeData(ThemeData themeData) {
    _themedata = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themedata == lightMode) {
      _themedata = darkMode;
    } else {
      _themedata = lightMode;
    }
    notifyListeners(); // Notify listeners that the theme has changed
  }
}
