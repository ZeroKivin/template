part of 'theme_mode_data_source.dart';

final class _LocalThemeModeDataSource extends CacheDao
    implements ThemeModeDataSource {
  final Codec<ThemeMode, String> codec;

  const _LocalThemeModeDataSource({
    required super.sharedPreferences,
    required this.codec,
  });

  CacheEntry<String> get _themeMode => stringEntry('theme.mode');

  @override
  Future<void> setThemeMode(ThemeMode mode) => _themeMode.setIfNullRemove(
        codec.encode(mode),
      );

  @override
  Future<ThemeMode?> getThemeMode() async {
    final mode = _themeMode.read();

    if (mode == null) {
      return null;
    }

    return codec.decode(mode);
  }
}
