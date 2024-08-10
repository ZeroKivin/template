import 'dart:async';
import 'dart:ui';

abstract interface class LocaleDataSource {
  Future<Locale?> get locale;

  Future<void> setLocale(Locale locale);
}
