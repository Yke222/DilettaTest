import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'http_client.dart';

class DioHttpAdapter implements HttpClient {
  final Dio _client;
  static const Duration _defaultConnectionTimeout = Duration(seconds: 10);

  DioHttpAdapter({
    required String baseUrl,
    List<Interceptor>? interceptors,
  }) : _client = Dio(
          BaseOptions(
            baseUrl: baseUrl,
            headers: {
              'Content-Type': 'application/json',
            },
          ),
        ) {
    _client.interceptors.addAll([
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        request: true,
        error: true,
        enabled: kDebugMode,
      ),
    ]);
  }

  Future<HttpResponse> _handleRequest(
    HttpOptions options, {
    bool useCustomUrl = false,
  }) async {
    final String url =
        useCustomUrl ? options.path : _client.options.baseUrl + options.path;
    Response<dynamic> response;

    try {
      response = await _client
          .request(
            url,
            data: options.body,
            queryParameters: options.query,
            options: Options(
              method: options.method.name.toUpperCase(),
              headers: options.headers,
            ),
          )
          .timeout(_defaultConnectionTimeout);

      return HttpResponse(
        data: response.data,
        status: response.statusCode?.convertToHttpStatus() ?? HttpStatus.ok,
      );
    } on DioException catch (e) {
      return HttpResponse(
        data: e.response?.data,
        status: e.response?.statusCode?.convertToHttpStatus() ??
            HttpStatus.badRequest,
      );
    }
  }

  @override
  Future<HttpResponse> get(
    String url, {
    bool useCustomUrl = false,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? query,
  }) {
    return _handleRequest(
      HttpOptions(
        path: url,
        method: HttpMethod.get,
        headers: headers,
        query: query,
      ),
      useCustomUrl: useCustomUrl,
    );
  }

  @override
  Future<HttpResponse> post(
    String url, {
    bool useCustomUrl = false,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
  }) {
    return _handleRequest(
      HttpOptions(
        path: url,
        method: HttpMethod.post,
        body: body,
        headers: headers,
        query: query,
      ),
      useCustomUrl: useCustomUrl,
    );
  }

  @override
  Future<HttpResponse> put(
    String url, {
    bool useCustomUrl = false,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
  }) {
    return _handleRequest(
      HttpOptions(
        path: url,
        method: HttpMethod.put,
        body: body,
        headers: headers,
        query: query,
      ),
      useCustomUrl: useCustomUrl,
    );
  }

  @override
  Future<HttpResponse> patch(
    String url, {
    bool useCustomUrl = false,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
  }) {
    return _handleRequest(
      HttpOptions(
        path: url,
        method: HttpMethod.patch,
        body: body,
        headers: headers,
        query: query,
      ),
      useCustomUrl: useCustomUrl,
    );
  }

  @override
  Future<HttpResponse> delete(
    String url, {
    bool useCustomUrl = false,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
  }) {
    return _handleRequest(
      HttpOptions(
        path: url,
        method: HttpMethod.delete,
        body: body,
        headers: headers,
        query: query,
      ),
      useCustomUrl: useCustomUrl,
    );
  }

  @override
  Future<Response> download(
    String url,
    String path,
  ) {
    return _client.download(url, path);
  }
}
