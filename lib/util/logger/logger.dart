import 'dart:async';

import 'common/base_logger.dart';
import 'default/default_logger.dart';

export 'common/base_logger.dart';
export 'common/log_level.dart';
export 'common/log_options.dart';

BaseLogger get logger => Zone.current[_loggerKey] as BaseLogger? ?? _logger;

T runWithLogger<T>(
  BaseLogger logger,
  T Function() callback,
) {
  return runZoned<T>(
    callback,
    zoneValues: {
      _loggerKey: logger,
    },
  );
}

const _loggerKey = 'logger';
final _logger = DefaultLogger();
