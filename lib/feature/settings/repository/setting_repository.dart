import 'dart:async';

import 'package:flutter/material.dart';

import 'data_source/locale/locale_data_source.dart';
import 'data_source/text_scale/text_scale_data_source.dart';
import 'data_source/theme_mode/theme_mode_data_source.dart';

abstract interface class SettingsRepository {
  Future<Locale?> get locale;

  Future<ThemeMode?> get themeMode;

  Future<double?> get textScale;

  Future<void> setLocale(Locale locale);

  Future<void> setThemeMode(ThemeMode mode);

  Future<void> setTextScale(double textScale);
}

final class DefaultSettingsRepository implements SettingsRepository {
  final ThemeModeDataSource _themeModeDataSource;
  final LocaleDataSource _localeDataSource;
  final TextScaleDataSource _textScaleDataSource;

  DefaultSettingsRepository({
    required ThemeModeDataSource themeModeDataSource,
    required LocaleDataSource localeDataSource,
    required TextScaleDataSource textScaleDataSource,
  })  : _themeModeDataSource = themeModeDataSource,
        _localeDataSource = localeDataSource,
        _textScaleDataSource = textScaleDataSource;

  @override
  Future<Locale?> get locale => _localeDataSource.locale;

  @override
  Future<ThemeMode?> get themeMode => _themeModeDataSource.themeMode;

  @override
  Future<double?> get textScale => _textScaleDataSource.textScale;

  @override
  Future<void> setLocale(Locale locale) => _localeDataSource.setLocale(locale);

  @override
  Future<void> setThemeMode(ThemeMode mode) =>
      _themeModeDataSource.setThemeMode(mode);

  @override
  Future<void> setTextScale(double textScale) =>
      _textScaleDataSource.setTextScale(textScale);
}
