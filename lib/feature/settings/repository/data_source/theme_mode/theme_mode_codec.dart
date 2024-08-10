import 'dart:convert';

import 'package:flutter/material.dart';

final class ThemeModeCodec extends Codec<ThemeMode, String> {
  const ThemeModeCodec();

  @override
  Converter<String, ThemeMode> get decoder => const _ThemeModeDecoder();

  @override
  Converter<ThemeMode, String> get encoder => const _ThemeModeEncoder();
}

final class _ThemeModeDecoder extends Converter<String, ThemeMode> {
  const _ThemeModeDecoder();

  @override
  ThemeMode convert(String input) => ThemeMode.values.firstWhere(
        (themeMode) => themeMode.name == input,
        orElse: () => throw ArgumentError.value(
          input,
          'input',
          'Cannot convert $input to $ThemeMode',
        ),
      );
}

final class _ThemeModeEncoder extends Converter<ThemeMode, String> {
  const _ThemeModeEncoder();

  @override
  String convert(ThemeMode input) => input.name;
}
