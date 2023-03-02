import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:provider/provider.dart';
import 'package:template/config/app_config.dart';
import 'package:template/config/environment/environment.dart';
import 'package:template/internal/app.dart';
import 'package:template/navigation/app_router.dart';
import 'package:template/util/error_handler/default_error_handler.dart';

class AppDependencies extends StatefulWidget {
  const AppDependencies({
    required this.app,
    Key? key,
  }) : super(key: key);

  final App app;

  @override
  State<AppDependencies> createState() => _AppDependenciesState();
}

class _AppDependenciesState extends State<AppDependencies> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppRouter>(
          create: (_) => AppRouter(),
        ),
        Provider<ErrorHandler>(
          create: (_) => DefaultErrorHandler(),
        ),
      ],
      child: widget.app,
    );
  }

  Dio _initDio([Iterable<Interceptor>? additionalInterceptors]) {
    const timeout = Duration(seconds: 30);

    final dio = Dio();
    final environment = Environment<AppConfig>.instance();

    dio.options
      ..baseUrl = environment.config.url
      ..connectTimeout = timeout
      ..receiveTimeout = timeout
      ..sendTimeout = timeout;

    environment.addListener(() {
      dio.options.baseUrl = environment.config.url;
    });

    (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
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
