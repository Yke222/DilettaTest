import 'package:dio/dio.dart';

enum RequestTypeEnum { get, post, put, delete, patch }

abstract class HttpClient {
  Future<HttpResponse> doRequest(HttpRequest request);
}

class HttpRequest {
  HttpRequest({
    required this.path,
    required this.method,
    this.formData,
    this.mockFile,
    this.data,
    this.headers,
    this.params,
    this.queryParams,
  });

  dynamic data;
  FormData? formData;
  Map<String, dynamic>? headers;
  Map<String, dynamic>? params;
  Map<String, dynamic>? queryParams;
  String method;
  String path;
  String? mockFile;
}

class HttpResponse {
  HttpResponse({
    required this.statusCode,
    this.message,
    this.data,
  });

  final int? statusCode;
  final String? message;
  final dynamic data;

  HttpResponse copyWith({
    int? statusCode,
    String? message,
    dynamic data,
  }) {
    return HttpResponse(
      statusCode: statusCode ?? this.statusCode,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }
}
