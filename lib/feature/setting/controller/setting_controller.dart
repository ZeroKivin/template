import 'package:core_architecture/core_architecture.dart';
import 'package:flutter/material.dart';

import '../../../util/logger/logger.dart';
import '../repository/setting_repository.dart';
import '../state/setting_state.dart';

final class SettingController extends Controller<SettingState> {
  final SettingsRepository _settingRepository;

  SettingController({
    required super.initialState,
    required SettingsRepository settingsRepository,
  }) : _settingRepository = settingsRepository;

  void setLocale(Locale locale) => handle(
        handler: (state) async {
          await _settingRepository.setLocale(locale);

          return state.copyWith(
            locale: locale,
          );
        },
      );

  void setThemeMode(ThemeMode mode) => handle(
        handler: (state) async {
          await _settingRepository.setThemeMode(mode);

          return state.copyWith(
            themeMode: mode,
          );
        },
      );

  @override
  void onHandleError(Object error, StackTrace stackTrace) =>
      logger.logControllerError(
        runtimeType,
        error,
        stackTrace,
      );
}
