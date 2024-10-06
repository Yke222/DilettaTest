
import 'package:equatable/equatable.dart';

enum HttpStatus {
  noInternet,
  badRequest,
  forbidden,
  notFound,
  conflict,
  unprocessableEntity,
  unauthorized,
  requestTimeout,
  serverError
}

abstract class HttpException extends Equatable implements Exception {
  final HttpStatus? status;

  final String message;

  final dynamic data;

  const HttpException(
    this.status, {
    this.data,
    this.message = '',
  });

  @override
  List<Object?> get props => [status, data, message];
}

class NotInternetException extends HttpException {
  const NotInternetException({
    HttpStatus? status,
    Object? data,
    String message = '',
  }) : super(
          status ?? HttpStatus.noInternet,
          data: data,
          message: message,
        );
}

class NotFoundException extends HttpException {
  const NotFoundException({
    HttpStatus? status,
    Object? data,
    String message = '',
  }) : super(
          status ?? HttpStatus.notFound,
          data: data,
          message: message,
        );
}

class BadRequestException extends HttpException {
  const BadRequestException({
    HttpStatus? status,
    Object? data,
    String message = '',
  }) : super(
          status ?? HttpStatus.badRequest,
          data: data,
          message: message,
        );
}

class ServerErrorException extends HttpException {
  const ServerErrorException({
    String message = '',
  }) : super(
          HttpStatus.serverError,
          message: message,
        );
}

class UnprocessableEntityException extends HttpException {
  const UnprocessableEntityException({
    String message = '',
    Object? data,
  }) : super(
          HttpStatus.unprocessableEntity,
          message: message,
          data: data,
        );
}

class UnauthorizedException extends HttpException {
  const UnauthorizedException({
    String message = '',
    dynamic data,
  }) : super(
          HttpStatus.unauthorized,
          message: message,
          data: data,
        );
}

class TimeoutException extends HttpException {
  const TimeoutException({
    String message = '',
  }) : super(
          HttpStatus.requestTimeout,
          message: message,
        );
}

class UnknownConnectionError extends HttpException {
  const UnknownConnectionError({
    Object? data,
    String message = '',
  }) : super(
          null,
          data: data,
          message: message,
        );
}
