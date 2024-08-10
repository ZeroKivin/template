import 'dart:async';

import 'package:flutter/material.dart';

abstract interface class ThemeModeDataSource {
  Future<ThemeMode?> get themeMode;

  Future<void> setThemeMode(ThemeMode theme);
}
