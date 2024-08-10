import 'package:dio/dio.dart';

import '../../../../util/types.dart';
import '../rest_api_client.dart';

final class DioRestApiClient implements RestApiClient {
  final Dio _dio;

  static const String _contentType = 'application/json';

  DioRestApiClient({
    required Dio dio,
  }) : _dio = dio;

  @override
  Future<T> get<T>(
    String path, {
    Map<String, Object?>? headers,
    Map<String, Object?>? queryParameters,
  }) async {
    final response = await _dio.get<T>(
      path,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
        contentType: _contentType,
        responseType: ResponseType.json,
      ),
    );

    return response.requiredData;
  }

  @override
  Future<T> patch<T>(
    String path, {
    required Json? body,
    Map<String, Object?>? headers,
    Map<String, Object?>? queryParameters,
  }) async {
    final response = await _dio.patch<T>(
      path,
      data: body,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
        contentType: _contentType,
        responseType: ResponseType.json,
      ),
    );

    return response.requiredData;
  }

  @override
  Future<T> post<T>(
    String path, {
    required Json? body,
    Map<String, Object?>? headers,
    Map<String, Object?>? queryParameters,
  }) async {
    final response = await _dio.post<T>(
      path,
      data: body,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
        contentType: _contentType,
        responseType: ResponseType.json,
      ),
    );

    return response.requiredData;
  }

  @override
  Future<T> put<T>(
    String path, {
    required Json? body,
    Map<String, Object?>? headers,
    Map<String, Object?>? queryParameters,
  }) async {
    final response = await _dio.put<T>(
      path,
      data: body,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
        contentType: _contentType,
        responseType: ResponseType.json,
      ),
    );

    return response.requiredData;
  }

  @override
  Future<T> delete<T>(
    String path, {
    required Json? body,
    Map<String, Object?>? headers,
    Map<String, Object?>? queryParameters,
  }) async {
    final response = await _dio.delete<T>(
      path,
      data: body,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
        contentType: _contentType,
        responseType: ResponseType.json,
      ),
    );

    return response.requiredData;
  }
}

extension _RequiredData<T> on Response<T> {
  T get requiredData {
    final data = this.data;

    if (data == null) {
      throw StateError('Response data is null');
    }

    return data;
  }
}
