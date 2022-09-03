// ignore_for_file: cast_nullable_to_non_nullable, strict_raw_type

import 'package:flutter/foundation.dart';
import 'package:template/config/environment/build_type.dart';

/// Environment configuration.
class Environment<T> implements Listenable {
  Environment._(this._currentBuildType, T config)
      : _config = ValueNotifier(config);

  static Environment? _instance;

  final BuildType _currentBuildType;

  ValueNotifier<T> _config;

  /// Provides instance [Environment].
  factory Environment.instance() => _instance as Environment<T>;

  /// Configuration.
  T get config => _config.value;

  /// Is this application running in debug mode.
  bool get isDebug => _currentBuildType == BuildType.debug;

  /// Is this application running in release mode.
  bool get isRelease => _currentBuildType == BuildType.release;

  /// App build type.
  BuildType get buildType => _currentBuildType;

  set config(T c) => _config.value = c;

  @override
  void addListener(VoidCallback listener) {
    _config.addListener(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    _config.removeListener(listener);
  }

  /// Initializing the environment.
  static void init<T>({
    required BuildType buildType,
    required T config,
  }) {
    _instance ??= Environment<T>._(buildType, config);
  }
}
