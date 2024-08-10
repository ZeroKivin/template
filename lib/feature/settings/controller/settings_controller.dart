import 'dart:async';

import 'package:flutter/material.dart';

import '../state/settings_state.dart';

abstract interface class SettingsController {
  SettingsState get state;

  Stream<SettingsState> get stream;

  FutureOr<void> updateLocale(Locale locale);

  FutureOr<void> updateThemeMode(ThemeMode themeMode);

  FutureOr<void> updateTextScale(double textScale);
}
