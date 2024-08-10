import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

import '../common/base_logger.dart';
import '../common/log_level.dart';
import '../common/log_options.dart';
import 'default_log_level_codec.dart';

final class DefaultLogger extends BaseLogger {
  final Logger _logger;

  static const DefaultLogLevelCodec _codec = DefaultLogLevelCodec();

  DefaultLogger({
    LogOptions options = const LogOptions(),
  })  : _logger = Logger(
          level: _codec.decode(options.level),
          printer: PrettyPrinter(
            colors: options.colors,
            printEmojis: options.printEmojis,
            dateTimeFormat: options.printTime
                ? DateTimeFormat.onlyTimeAndSinceStart
                : DateTimeFormat.none,
          ),
        ),
        super(options);

  @override
  void log(
    LogLevel level,
    String message, {
    Object? error,
    StackTrace? stackTrace,
  }) {
    if (kReleaseMode && !options.logInRelease) {
      return;
    }

    _logger.log(
      _codec.decode(level),
      message,
      error: error,
      stackTrace: stackTrace,
    );
  }

  @override
  void logFlutterError(FlutterErrorDetails details) => error(
        details.exceptionAsString(),
        stackTrace: details.stack,
      );

  @override
  bool logPlatformDispatcherError(
    Object exception,
    StackTrace stackTrace,
  ) {
    error(
      'PlatformDispatcherError',
      error: exception,
      stackTrace: stackTrace,
    );

    return true;
  }

  @override
  void logZoneError(Object exception, StackTrace stackTrace) => fatal(
        'ZoneError',
        error: exception,
        stackTrace: stackTrace,
      );

  @override
  void logBlocError(
    Type runtimeType,
    Object exception,
    StackTrace stackTrace,
  ) =>
      error(
        '$runtimeType error',
        error: exception,
        stackTrace: stackTrace,
      );
}
