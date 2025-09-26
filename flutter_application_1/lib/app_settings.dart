// lib/app_settings.dart
import 'package:flutter/material.dart';

class AppSettings extends ChangeNotifier {
  ThemeMode _mode = ThemeMode.light;
  ThemeMode get mode => _mode;

  void setDark(bool isDark) {
    _mode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

final settings = AppSettings();
