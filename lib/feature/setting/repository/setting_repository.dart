import 'dart:async';

import 'package:flutter/material.dart';

import 'data_source/locale/locale_data_source.dart';
import 'data_source/theme_mode/theme_mode_data_source.dart';

final class SettingsRepository {
  final ThemeModeDataSource _themeModeDataSource;
  final LocaleDataSource _localeDataSource;

  SettingsRepository({
    required ThemeModeDataSource themeModeDataSource,
    required LocaleDataSource localeDataSource,
  })  : _themeModeDataSource = themeModeDataSource,
        _localeDataSource = localeDataSource;

  Future<Locale?> getLocale() => _localeDataSource.getLocale();

  Future<ThemeMode?> getThemeMode() => _themeModeDataSource.getThemeMode();

  Future<void> setLocale(Locale locale) => _localeDataSource.setLocale(locale);

  Future<void> setThemeMode(ThemeMode mode) =>
      _themeModeDataSource.setThemeMode(mode);
}
