import 'dart:async';

abstract base class CacheEntry<T extends Object> {
  const CacheEntry();

  String get key;

  T? read();

  Future<void> set(T value);

  Future<void> remove();

  Future<void> setIfNullRemove(T? value) =>
      value == null ? remove() : set(value);
}
