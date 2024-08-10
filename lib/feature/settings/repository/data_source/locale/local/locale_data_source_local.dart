import 'dart:ui';

import '../../../../../../util/cache/cache_dao.dart';
import '../locale_data_source.dart';

final class LocaleDataSourceLocal extends CacheDao implements LocaleDataSource {
  late final CacheEntry<String> _locale = stringEntry('settings.locale');

  LocaleDataSourceLocal({
    required super.sharedPreferences,
  });

  @override
  Future<Locale?> get locale async {
    final languageCode = await _locale.read();

    if (languageCode == null) {
      return null;
    }

    return Locale.fromSubtags(languageCode: languageCode);
  }

  @override
  Future<void> setLocale(Locale locale) => _locale.set(locale.languageCode);
}
