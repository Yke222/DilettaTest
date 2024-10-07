import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

InterceptorsWrapper loggingInterceptor() {
  return InterceptorsWrapper(
    onRequest: (options, handler) {
      if (kDebugMode) {
        print('Request: [${options.method}] ${options.baseUrl}${options.path}');
        print('Headers: ${options.headers}');
        print('Query Parameters: ${options.queryParameters}');
      }
      return handler.next(options);
    },
    onResponse: (response, handler) {
      if (kDebugMode) {
        print('Response: [${response.statusCode}] ${response.requestOptions.method} ${response.requestOptions.path}');
        print('Data: ${response.data}');
      }
      return handler.next(response);
    },
    onError: (DioException e, handler) {
      if (kDebugMode) {
        print('Error: [${e.response?.statusCode}] ${e.requestOptions.method} ${e.requestOptions.path}');
        print('Message: ${e.message}');
        print('Data: ${e.response?.data}');
      }
      return handler.next(e);
    },
  );
}