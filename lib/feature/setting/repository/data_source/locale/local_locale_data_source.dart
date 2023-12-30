part of 'locale_data_source.dart';

final class _LocalLocaleDataSource extends CacheDao
    implements LocaleDataSource {
  const _LocalLocaleDataSource({
    required super.sharedPreferences,
  });

  CacheEntry<String> get _locale => stringEntry('settings.locale');

  @override
  Future<void> setLocale(Locale locale) async {
    await _locale.set(locale.languageCode);
  }

  @override
  Future<Locale?> getLocale() async {
    final languageCode = _locale.read();

    if (languageCode == null) {
      return null;
    }

    return Locale.fromSubtags(languageCode: languageCode);
  }
}
