import 'package:dio/dio.dart';

import '../../connectivity/connectivity.dart';
import '../adapter.dart';
import 'handler_response.dart';

class HttpClientImpl implements HttpClient {
  HttpClientImpl({
    required this.dioInstance,
    required this.connectivity,
  });

  final Dio dioInstance;
  final InternetConnectivity connectivity;

  Future<Response> _makeRequest(HttpRequest request) async {
    try {
      if (!await connectivity.hasInternet()) {
        throw const NotInternetException();
      }

      final headers = <String, dynamic>{
        Headers.contentTypeHeader: 'application/json',
        Headers.acceptHeader: 'application/json',
      };

      request.headers == null
          ? request.headers = headers
          : request.headers?.addAll(headers);

      final response = await dioInstance.request(
        request.path,
        options: Options(
          headers: request.headers,
          method: request.method,
          responseType: ResponseType.json,
        ),
        queryParameters: request.queryParams,
        data: request.formData ?? request.data,
      );

      final result = HttpResponseHandler.handle(response);

      return Response(
        requestOptions: RequestOptions(
          path: request.path,
        ),
        data: result,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<HttpResponse> doRequest(HttpRequest request) async {
    final response = await _makeRequest(request);

    return HttpResponse(
      statusCode: response.statusCode,
      data: response.data,
    );
  }
}
