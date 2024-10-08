import 'package:diletta_shop/shared/services/http/http_result.dart';

abstract class HttpService {
  Future<HttpResult> get(String url, {Map<String, dynamic>? headers});
}