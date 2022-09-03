import 'package:template/config/app_config.dart';
import 'package:template/config/environment/environment.dart';

/// Server urls.
abstract class Url {
  /// Prod proxy url.
  static String get prodProxyUrl => '';

  /// Dev proxy url.
  static String get devProxyUrl => '';

  /// Prod url.
  static String get prodUrl => '';

  /// Dev url.
  static String get devUrl => '';

  /// Base url.
  static String get baseUrl => Environment<AppConfig>.instance().config.url;
}
