import 'dart:io';

class ErrorException {
  final String message;
  final HttpStatus? httpStatus;

  ErrorException({
    this.message = '',
    this.httpStatus,
  });
}
