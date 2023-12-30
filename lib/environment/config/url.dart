import '../environment.dart';

/// Server urls.
class Url {
  /// Prod url.
  static String get prodUrl => '';

  /// Dev url.
  static String get devUrl => '';

  /// Base url.
  static String get baseUrl => Environment<AppConfig>.instance().config.url;

  const Url._();
}
