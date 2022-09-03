import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._(this.themeData);

  final ThemeData themeData;

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
