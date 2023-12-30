import 'dart:async';
import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../util/cache/cache_dao.dart';

part 'local_locale_data_source.dart';

abstract interface class LocaleDataSource {
  factory LocaleDataSource.local({
    required SharedPreferences sharedPreferences,
  }) =>
      _LocalLocaleDataSource(
        sharedPreferences: sharedPreferences,
      );

  Future<void> setLocale(Locale locale);

  Future<Locale?> getLocale();
}
