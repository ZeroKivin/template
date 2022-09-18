import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:elementary/elementary.dart';
import 'package:kiwi/kiwi.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:template/config/app_config.dart';
import 'package:template/config/environment/environment.dart';
import 'package:template/util/error_handler/default_error_handler.dart';

class Injector {
  Injector() {
    _createContainer();
  }

  final KiwiContainer _container = KiwiContainer();

  /// Return instance of type [T].
  T resolve<T>() => _container.resolve<T>();

  void _createContainer() {
    final dio = _initDio();
    final errorHandler = DefaultErrorHandler();

    _container
      ..registerSingleton<Dio>(
        (_) => dio,
      )
      ..registerSingleton<ErrorHandler>(
        (_) => errorHandler,
      );
  }

  Dio _initDio([Iterable<Interceptor>? additionalInterceptors]) {
    const timeout = Duration(seconds: 30);

    final dio = Dio();
    final environment = Environment<AppConfig>.instance();

    dio.options
      ..baseUrl = environment.config.url
      ..connectTimeout = timeout.inMilliseconds
      ..receiveTimeout = timeout.inMilliseconds
      ..sendTimeout = timeout.inMilliseconds;

    environment.addListener(() {
      dio.options.baseUrl = environment.config.url;
    });

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      final proxyUrl = environment.config.proxyUrl;
      if (proxyUrl != null && proxyUrl.isNotEmpty) {
        client
          ..findProxy = (uri) {
            return 'PROXY $proxyUrl';
          }
          ..badCertificateCallback = (_, __, ___) {
            return true;
          };
      }

      return client;
    };

    if (additionalInterceptors != null) {
      dio.interceptors.addAll(additionalInterceptors);
    }

    if (environment.isDebug) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestBody: true,
        ),
      );
    }

    return dio;
  }
}
