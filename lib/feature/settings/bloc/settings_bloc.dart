import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../util/bloc/logable_bloc.dart';
import '../controller/settings_controller.dart';
import '../repository/setting_repository.dart';
import '../state/settings_state.dart';

part 'settings_bloc.freezed.dart';
part 'settings_event.dart';

final class SettingsBloc extends LogableBloc<SettingsEvent, SettingsState>
    implements SettingsController {
  final DefaultSettingsRepository _settingsRepository;

  SettingsBloc({
    required DefaultSettingsRepository settingsRepository,
    required SettingsState initialState,
  })  : _settingsRepository = settingsRepository,
        super(initialState) {
    on<SettingsEvent>(
      (event, emit) => switch (event) {
        _LocaleSettingsUpdated() => _updateLocale(event, emit),
        _ThemeModeSettingsUpdated() => _updateThemeMode(event, emit),
        _TextScaleSettingsUpdated() => _updateTextScale(event, emit),
      },
      transformer: sequential(),
    );
  }

  @override
  void updateLocale(Locale locale) => add(
        SettingsEvent.localeUpdated(locale: locale),
      );

  @override
  void updateThemeMode(ThemeMode themeMode) => add(
        SettingsEvent.themeModeUpdated(themeMode: themeMode),
      );

  @override
  void updateTextScale(double textScale) => add(
        SettingsEvent.textScaleUpdated(textScale: textScale),
      );

  Future<void> _updateLocale(
    _LocaleSettingsUpdated event,
    Emitter<SettingsState> emit,
  ) async {
    try {
      await _settingsRepository.setLocale(event.locale);

      emit(
        state.copyWith(locale: event.locale),
      );
    } on Object catch (error, stackTrace) {
      onError(error, stackTrace);
    }
  }

  Future<void> _updateThemeMode(
    _ThemeModeSettingsUpdated event,
    Emitter<SettingsState> emit,
  ) async {
    try {
      await _settingsRepository.setThemeMode(event.themeMode);

      emit(
        state.copyWith(themeMode: event.themeMode),
      );
    } on Object catch (error, stackTrace) {
      onError(error, stackTrace);
    }
  }

  Future<void> _updateTextScale(
    _TextScaleSettingsUpdated event,
    Emitter<SettingsState> emit,
  ) async {
    try {
      await _settingsRepository.setTextScale(event.textScale);

      emit(
        state.copyWith(textScale: event.textScale),
      );
    } on Object catch (error, stackTrace) {
      onError(error, stackTrace);
    }
  }
}
