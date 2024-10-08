class HttpResult {
  final dynamic data;
  final int statusCode;
  final Map<String, dynamic>? headers;

  HttpResult({
    required this.data,
    required this.statusCode,
    this.headers
  });

  bool get isSuccess => statusCode >= 200 && statusCode < 300;
}