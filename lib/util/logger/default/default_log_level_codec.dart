import 'dart:convert';

import 'package:logger/logger.dart';

import '../common/log_level.dart';

final class DefaultLogLevelCodec extends Codec<Level, LogLevel> {
  const DefaultLogLevelCodec();

  @override
  Converter<LogLevel, Level> get decoder => const _DefaultLogLevelDecoder();

  @override
  Converter<Level, LogLevel> get encoder => const _DefaultLogLevelEncoder();
}

final class _DefaultLogLevelDecoder extends Converter<LogLevel, Level> {
  const _DefaultLogLevelDecoder();

  @override
  Level convert(LogLevel level) => switch (level) {
        LogLevel.fatal => Level.fatal,
        LogLevel.error => Level.error,
        LogLevel.warning => Level.warning,
        LogLevel.info => Level.info,
        LogLevel.debug => Level.debug,
        LogLevel.verbose => Level.trace,
      };
}

final class _DefaultLogLevelEncoder extends Converter<Level, LogLevel> {
  const _DefaultLogLevelEncoder();

  @override
  LogLevel convert(Level level) => switch (level) {
        Level.fatal => LogLevel.fatal,
        Level.error => LogLevel.error,
        Level.warning => LogLevel.warning,
        Level.info => LogLevel.info,
        Level.debug => LogLevel.debug,
        _ => LogLevel.verbose,
      };
}
