import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../../../util/cache/cache_dao.dart';
import '../theme_mode_data_source.dart';

final class ThemeModeDataSourceLocal extends CacheDao
    implements ThemeModeDataSource {
  final Codec<ThemeMode, String> codec;

  late final CacheEntry<String> _themeMode = stringEntry('settings.theme_mode');

  ThemeModeDataSourceLocal({
    required super.sharedPreferences,
    required this.codec,
  });

  @override
  Future<ThemeMode?> get themeMode async {
    final mode = await _themeMode.read();

    if (mode == null) {
      return null;
    }

    return codec.decode(mode);
  }

  @override
  Future<void> setThemeMode(ThemeMode mode) => _themeMode.set(
        codec.encode(mode),
      );
}
