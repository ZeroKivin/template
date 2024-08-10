// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SettingsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Locale locale) localeUpdated,
    required TResult Function(ThemeMode themeMode) themeModeUpdated,
    required TResult Function(double textScale) textScaleUpdated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Locale locale)? localeUpdated,
    TResult? Function(ThemeMode themeMode)? themeModeUpdated,
    TResult? Function(double textScale)? textScaleUpdated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Locale locale)? localeUpdated,
    TResult Function(ThemeMode themeMode)? themeModeUpdated,
    TResult Function(double textScale)? textScaleUpdated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LocaleSettingsUpdated value) localeUpdated,
    required TResult Function(_ThemeModeSettingsUpdated value) themeModeUpdated,
    required TResult Function(_TextScaleSettingsUpdated value) textScaleUpdated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LocaleSettingsUpdated value)? localeUpdated,
    TResult? Function(_ThemeModeSettingsUpdated value)? themeModeUpdated,
    TResult? Function(_TextScaleSettingsUpdated value)? textScaleUpdated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LocaleSettingsUpdated value)? localeUpdated,
    TResult Function(_ThemeModeSettingsUpdated value)? themeModeUpdated,
    TResult Function(_TextScaleSettingsUpdated value)? textScaleUpdated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc

class _$LocaleSettingsUpdatedImpl extends _LocaleSettingsUpdated {
  const _$LocaleSettingsUpdatedImpl({required this.locale}) : super._();

  @override
  final Locale locale;

  @override
  String toString() {
    return 'SettingsEvent.localeUpdated(locale: $locale)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocaleSettingsUpdatedImpl &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locale);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Locale locale) localeUpdated,
    required TResult Function(ThemeMode themeMode) themeModeUpdated,
    required TResult Function(double textScale) textScaleUpdated,
  }) {
    return localeUpdated(locale);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Locale locale)? localeUpdated,
    TResult? Function(ThemeMode themeMode)? themeModeUpdated,
    TResult? Function(double textScale)? textScaleUpdated,
  }) {
    return localeUpdated?.call(locale);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Locale locale)? localeUpdated,
    TResult Function(ThemeMode themeMode)? themeModeUpdated,
    TResult Function(double textScale)? textScaleUpdated,
    required TResult orElse(),
  }) {
    if (localeUpdated != null) {
      return localeUpdated(locale);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LocaleSettingsUpdated value) localeUpdated,
    required TResult Function(_ThemeModeSettingsUpdated value) themeModeUpdated,
    required TResult Function(_TextScaleSettingsUpdated value) textScaleUpdated,
  }) {
    return localeUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LocaleSettingsUpdated value)? localeUpdated,
    TResult? Function(_ThemeModeSettingsUpdated value)? themeModeUpdated,
    TResult? Function(_TextScaleSettingsUpdated value)? textScaleUpdated,
  }) {
    return localeUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LocaleSettingsUpdated value)? localeUpdated,
    TResult Function(_ThemeModeSettingsUpdated value)? themeModeUpdated,
    TResult Function(_TextScaleSettingsUpdated value)? textScaleUpdated,
    required TResult orElse(),
  }) {
    if (localeUpdated != null) {
      return localeUpdated(this);
    }
    return orElse();
  }
}

abstract class _LocaleSettingsUpdated extends SettingsEvent {
  const factory _LocaleSettingsUpdated({required final Locale locale}) =
      _$LocaleSettingsUpdatedImpl;
  const _LocaleSettingsUpdated._() : super._();

  Locale get locale;
}

/// @nodoc

class _$ThemeModeSettingsUpdatedImpl extends _ThemeModeSettingsUpdated {
  const _$ThemeModeSettingsUpdatedImpl({required this.themeMode}) : super._();

  @override
  final ThemeMode themeMode;

  @override
  String toString() {
    return 'SettingsEvent.themeModeUpdated(themeMode: $themeMode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThemeModeSettingsUpdatedImpl &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, themeMode);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Locale locale) localeUpdated,
    required TResult Function(ThemeMode themeMode) themeModeUpdated,
    required TResult Function(double textScale) textScaleUpdated,
  }) {
    return themeModeUpdated(themeMode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Locale locale)? localeUpdated,
    TResult? Function(ThemeMode themeMode)? themeModeUpdated,
    TResult? Function(double textScale)? textScaleUpdated,
  }) {
    return themeModeUpdated?.call(themeMode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Locale locale)? localeUpdated,
    TResult Function(ThemeMode themeMode)? themeModeUpdated,
    TResult Function(double textScale)? textScaleUpdated,
    required TResult orElse(),
  }) {
    if (themeModeUpdated != null) {
      return themeModeUpdated(themeMode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LocaleSettingsUpdated value) localeUpdated,
    required TResult Function(_ThemeModeSettingsUpdated value) themeModeUpdated,
    required TResult Function(_TextScaleSettingsUpdated value) textScaleUpdated,
  }) {
    return themeModeUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LocaleSettingsUpdated value)? localeUpdated,
    TResult? Function(_ThemeModeSettingsUpdated value)? themeModeUpdated,
    TResult? Function(_TextScaleSettingsUpdated value)? textScaleUpdated,
  }) {
    return themeModeUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LocaleSettingsUpdated value)? localeUpdated,
    TResult Function(_ThemeModeSettingsUpdated value)? themeModeUpdated,
    TResult Function(_TextScaleSettingsUpdated value)? textScaleUpdated,
    required TResult orElse(),
  }) {
    if (themeModeUpdated != null) {
      return themeModeUpdated(this);
    }
    return orElse();
  }
}

abstract class _ThemeModeSettingsUpdated extends SettingsEvent {
  const factory _ThemeModeSettingsUpdated(
      {required final ThemeMode themeMode}) = _$ThemeModeSettingsUpdatedImpl;
  const _ThemeModeSettingsUpdated._() : super._();

  ThemeMode get themeMode;
}

/// @nodoc

class _$TextScaleSettingsUpdatedImpl extends _TextScaleSettingsUpdated {
  const _$TextScaleSettingsUpdatedImpl({required this.textScale}) : super._();

  @override
  final double textScale;

  @override
  String toString() {
    return 'SettingsEvent.textScaleUpdated(textScale: $textScale)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TextScaleSettingsUpdatedImpl &&
            (identical(other.textScale, textScale) ||
                other.textScale == textScale));
  }

  @override
  int get hashCode => Object.hash(runtimeType, textScale);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Locale locale) localeUpdated,
    required TResult Function(ThemeMode themeMode) themeModeUpdated,
    required TResult Function(double textScale) textScaleUpdated,
  }) {
    return textScaleUpdated(textScale);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Locale locale)? localeUpdated,
    TResult? Function(ThemeMode themeMode)? themeModeUpdated,
    TResult? Function(double textScale)? textScaleUpdated,
  }) {
    return textScaleUpdated?.call(textScale);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Locale locale)? localeUpdated,
    TResult Function(ThemeMode themeMode)? themeModeUpdated,
    TResult Function(double textScale)? textScaleUpdated,
    required TResult orElse(),
  }) {
    if (textScaleUpdated != null) {
      return textScaleUpdated(textScale);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LocaleSettingsUpdated value) localeUpdated,
    required TResult Function(_ThemeModeSettingsUpdated value) themeModeUpdated,
    required TResult Function(_TextScaleSettingsUpdated value) textScaleUpdated,
  }) {
    return textScaleUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LocaleSettingsUpdated value)? localeUpdated,
    TResult? Function(_ThemeModeSettingsUpdated value)? themeModeUpdated,
    TResult? Function(_TextScaleSettingsUpdated value)? textScaleUpdated,
  }) {
    return textScaleUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LocaleSettingsUpdated value)? localeUpdated,
    TResult Function(_ThemeModeSettingsUpdated value)? themeModeUpdated,
    TResult Function(_TextScaleSettingsUpdated value)? textScaleUpdated,
    required TResult orElse(),
  }) {
    if (textScaleUpdated != null) {
      return textScaleUpdated(this);
    }
    return orElse();
  }
}

abstract class _TextScaleSettingsUpdated extends SettingsEvent {
  const factory _TextScaleSettingsUpdated({required final double textScale}) =
      _$TextScaleSettingsUpdatedImpl;
  const _TextScaleSettingsUpdated._() : super._();

  double get textScale;
}
