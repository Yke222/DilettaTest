import 'package:diletta_shop/core/failures/failures.dart';
import 'package:diletta_shop/shared/services/http/http_result.dart';
import 'package:diletta_shop/shared/services/http/http_service.dart';
import 'package:dio/dio.dart';

class DioHttpService implements HttpService {
  final Dio _dio;

  DioHttpService({required Dio dio}) : _dio = dio;

  @override
  Future<HttpResult> get(String url, {Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.get(url, options: Options(headers: headers));
      return HttpResult(data: response.data, statusCode: response.statusCode!);
    } catch (e) {
      return _handleException(e);
    }
  }

  HttpResult _handleException(dynamic exception) {
    if (exception is DioException) {
      return HttpResult(
          data: exception.response?.data,
          statusCode: exception.response?.statusCode ?? 0);
    } 

    return HttpResult(data: NetworkFailure(exception.toString()), statusCode: 500);
  }
}