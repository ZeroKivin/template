import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../util/cache/cache_dao.dart';
import 'theme_mode_codec.dart';

part 'local_theme_mode_data_source.dart';

abstract interface class ThemeModeDataSource {
  factory ThemeModeDataSource.local({
    required SharedPreferences sharedPreferences,
    required ThemeModeCodec codec,
  }) =>
      _LocalThemeModeDataSource(
        sharedPreferences: sharedPreferences,
        codec: codec,
      );

  Future<void> setThemeMode(ThemeMode theme);

  Future<ThemeMode?> getThemeMode();
}
