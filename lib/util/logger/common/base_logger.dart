import 'package:flutter/foundation.dart';

import 'log_level.dart';
import 'log_options.dart';

abstract base class BaseLogger {
  final LogOptions options;

  BaseLogger(this.options);

  void fatal(
    String message, {
    Object? error,
    StackTrace? stackTrace,
  }) =>
      log(
        LogLevel.fatal,
        message,
        error: error,
        stackTrace: stackTrace,
      );

  void error(
    String message, {
    Object? error,
    StackTrace? stackTrace,
  }) =>
      log(
        LogLevel.error,
        message,
        error: error,
        stackTrace: stackTrace,
      );

  void warning(String message) => log(
        LogLevel.warning,
        message,
      );

  void info(String message) => log(
        LogLevel.info,
        message,
      );

  void debug(String message) => log(
        LogLevel.debug,
        message,
      );

  void verbose(String message) => log(
        LogLevel.verbose,
        message,
      );

  void log(
    LogLevel level,
    String message, {
    Object? error,
    StackTrace? stackTrace,
  });

  void logFlutterError(FlutterErrorDetails details);

  bool logPlatformDispatcherError(
    Object exception,
    StackTrace stackTrace,
  );

  void logZoneError(
    Object exception,
    StackTrace stackTrace,
  );

  void logBlocError(
    Type runtimeType,
    Object exception,
    StackTrace stackTrace,
  );
}
