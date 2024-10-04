import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../core.dart';

class CustomDioClient {
  CustomDioClient._();

  static Dio initialize({
    required InternetConnectivity internetConnectivity,
    required String baseUrl,
    bool debugMode = false,
  }) {
    return Dio()
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = const Duration(seconds: 20)
      ..options.receiveTimeout = const Duration(seconds: 20)
      ..options.validateStatus = validateStatus
      ..options.contentType = Headers.jsonContentType
      ..interceptors.addAll(
        [
          InternetCheckerInterceptor(
            internetConnectivity: internetConnectivity,
          ),
          if (debugMode)
            PrettyDioLogger(
              requestHeader: true,
              requestBody: true,
              responseBody: true,
              responseHeader: true,
              request: true,
              error: true,
              enabled: kDebugMode,
            ),
        ],
      );
  }
}

bool validateStatus(int? statusCode) => true;
