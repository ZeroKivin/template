import 'package:flutter/material.dart';

class AppTheme {
  final ThemeData themeData;

  AppTheme._(this.themeData);

  factory AppTheme.light() {
    return AppTheme._(
      ThemeData(
        useMaterial3: true,
        pageTransitionsTheme: const PageTransitionsTheme(),
      ),
    );
  }

  factory AppTheme.dark() {
    return AppTheme._(
      ThemeData(
        useMaterial3: true,
        pageTransitionsTheme: const PageTransitionsTheme(),
      ),
    );
  }
}
