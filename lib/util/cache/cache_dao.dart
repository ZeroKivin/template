import 'package:shared_preferences/shared_preferences.dart';

import 'cache_entry.dart';

export 'cache_entry.dart';

abstract base class CacheDao {
  final SharedPreferences _sharedPreferences;

  const CacheDao({required SharedPreferences sharedPreferences})
      : _sharedPreferences = sharedPreferences;

  CacheEntry<bool> boolEntry(String key) => _CacheEntry<bool>(
        key: key,
        sharedPreferences: _sharedPreferences,
      );

  CacheEntry<double> doubleEntry(String key) => _CacheEntry<double>(
        key: key,
        sharedPreferences: _sharedPreferences,
      );

  CacheEntry<int> intEntry(String key) => _CacheEntry<int>(
        key: key,
        sharedPreferences: _sharedPreferences,
      );

  CacheEntry<String> stringEntry(String key) => _CacheEntry<String>(
        key: key,
        sharedPreferences: _sharedPreferences,
      );

  CacheEntry<Iterable<String>> iterableStringEntry(String key) =>
      _CacheEntry<Iterable<String>>(
        key: key,
        sharedPreferences: _sharedPreferences,
      );
}

final class _CacheEntry<T extends Object> extends CacheEntry<T> {
  _CacheEntry({
    required SharedPreferences sharedPreferences,
    required this.key,
  }) : _sharedPreferences = sharedPreferences;

  final SharedPreferences _sharedPreferences;

  @override
  final String key;

  @override
  T? read() {
    final value = _sharedPreferences.get(key);

    if (value == null) {
      return null;
    }

    if (value is T) {
      return value;
    }

    throw Exception(
      'The value of $key is not of type ${T.runtimeType}',
    );
  }

  @override
  Future<void> set(T value) => switch (value) {
        final int value => _sharedPreferences.setInt(key, value),
        final double value => _sharedPreferences.setDouble(key, value),
        final String value => _sharedPreferences.setString(key, value),
        final bool value => _sharedPreferences.setBool(key, value),
        final Iterable<String> value => _sharedPreferences.setStringList(
            key,
            value.toList(),
          ),
        _ => throw Exception(
            '$T is not a valid type for a preferences entry value.',
          ),
      };

  @override
  Future<void> remove() => _sharedPreferences.remove(key);
}
