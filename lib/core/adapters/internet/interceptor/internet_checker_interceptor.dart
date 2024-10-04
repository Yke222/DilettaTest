import 'package:dio/dio.dart';
import '../../../core.dart';

class InternetCheckerInterceptor implements Interceptor {
  const InternetCheckerInterceptor({
    required this.internetConnectivity,
  });

  final InternetConnectivity internetConnectivity;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final hasInternet = await internetConnectivity.hasInternet();
    if (!hasInternet) {
      throw const NotInternetException();
    }
    handler.next(err);
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final hasInternet = await internetConnectivity.hasInternet();
    if (!hasInternet) {
      throw const NotInternetException();
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }
}
