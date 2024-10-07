import 'package:dio/dio.dart';
import '../constants/app_constants.dart';
import '../impl/dio/dio_get_client.dart';
import '../impl/dio/dio_impl.dart';

DioGetClient makeHttpGetClient() => DioImpl(
      client: Dio(BaseOptions(
        baseUrl: AppConstants.baseUrl,
      )),
    );
