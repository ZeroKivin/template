import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_state.freezed.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState({
    required Locale locale,
    required ThemeMode themeMode,
    required double textScale,
  }) = _SettingsState;
}
