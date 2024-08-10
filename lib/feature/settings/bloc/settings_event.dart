part of 'settings_bloc.dart';

@Freezed(copyWith: false)
sealed class SettingsEvent {
  const factory SettingsEvent.localeUpdated({
    required Locale locale,
  }) = _LocaleSettingsUpdated;

  const factory SettingsEvent.themeModeUpdated({
    required ThemeMode themeMode,
  }) = _ThemeModeSettingsUpdated;

  const factory SettingsEvent.textScaleUpdated({
    required double textScale,
  }) = _TextScaleSettingsUpdated;

  const SettingsEvent._();
}
