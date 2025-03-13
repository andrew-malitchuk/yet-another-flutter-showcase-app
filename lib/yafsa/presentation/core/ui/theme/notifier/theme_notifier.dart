import 'package:flutter/cupertino.dart';

class ThemeNotifier extends ChangeNotifier {
  bool isDarkMode = false;

  void setTheme(bool isDarkMode) {
    this.isDarkMode = isDarkMode;
    notifyListeners();
  }

  void toggleTheme() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }
}