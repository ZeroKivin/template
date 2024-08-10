import 'package:flutter/foundation.dart';

import 'build_type.dart';
import 'config/app_config.dart';

export 'build_type.dart';
export 'config/app_config.dart';
export 'config/debug_options.dart';
export 'config/url.dart';

/// Environment configuration.
final class Environment<T extends AppConfig> implements Listenable {
  static Environment? _instance;

  final BuildType _buildType;
  final ValueNotifier<T> _config;

  Environment._(
    this._buildType,
    T config,
  ) : _config = ValueNotifier(config);

  /// Provides instance [Environment].
  factory Environment.instance() {
    final instance = _instance;

    if (instance == null) {
      throw StateError("Environment isn't initialized");
    }

    return instance as Environment<T>;
  }

  /// Configuration.
  T get config => _config.value;

  /// Is this application running in debug mode.
  bool get isDebug => _buildType == BuildType.debug;

  /// Is this application running in release mode.
  bool get isRelease => _buildType == BuildType.release;

  /// App build type.
  BuildType get buildType => _buildType;

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
  static void initialize<T extends AppConfig>({
    required BuildType buildType,
    required T config,
  }) {
    _instance ??= Environment<T>._(buildType, config);
  }
}
