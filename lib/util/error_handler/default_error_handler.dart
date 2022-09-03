import 'package:elementary/elementary.dart';
import 'package:template/util/logger/logger.dart';

/// Base implementation of error handler.
/// This just log error to console.
class DefaultErrorHandler implements ErrorHandler {
  @override
  void handleError(Object error, {StackTrace? stackTrace}) {
    logger.e(error);
  }
}
