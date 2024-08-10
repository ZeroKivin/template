import '../../../util/types.dart';

abstract interface class RestApiClient {
  Future<T> get<T>(
    String path, {
    Map<String, Object?>? headers,
    Map<String, Object?>? queryParameters,
  });

  Future<T> post<T>(
    String path, {
    required Json? body,
    Map<String, Object?>? headers,
    Map<String, Object?>? queryParameters,
  });

  Future<T> put<T>(
    String path, {
    required Json? body,
    Map<String, Object?>? headers,
    Map<String, Object?>? queryParameters,
  });

  Future<T> delete<T>(
    String path, {
    required Json? body,
    Map<String, Object?>? headers,
    Map<String, Object?>? queryParameters,
  });

  Future<T> patch<T>(
    String path, {
    required Json? body,
    Map<String, Object?>? headers,
    Map<String, Object?>? queryParameters,
  });
}
