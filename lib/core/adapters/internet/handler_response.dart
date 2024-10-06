import 'dart:convert';

import 'package:dio/dio.dart';

import './exceptions/http_exception.dart';

class HttpResponseHandler {
  static dynamic handle(Response response, {bool isPdf = false}) {
    switch (response.statusCode) {
      case 200:
      case 201:
      case 202:
      case 304:
        return _handledata(
          response.data,
          empty: response.data is Map
              ? (response.data as Map).isEmpty
              : (response.data is List)
                  ? false
                  : true,
        );
      case 204:
        return null;
      case 400:
        throw const BadRequestException();
      case 401:
        throw const UnauthorizedException();
      case 403:
        throw const BadRequestException();
      case 404:
        throw const NotFoundException();

      case 422:
        throw const UnprocessableEntityException();

      default:
        throw const ServerErrorException();
    }
  }

  static dynamic _handledata(
    dynamic data, {
    bool empty = false,
  }) {
    if (empty) {
      return null;
    }

    if (data is String) {
      return jsonDecode(data);
    } else {
      return data;
    }
  }
}
