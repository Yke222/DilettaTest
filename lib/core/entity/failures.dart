abstract class Failure implements Exception {
  Failure({this.message = ''});

  String message;
}

class UnExpectedFailure extends Failure {
  UnExpectedFailure({super.message = ''});
}

class UnAuthorizedFailure extends Failure {
  UnAuthorizedFailure({super.message = ''});
}

class NotFoundFailure extends Failure {
  NotFoundFailure({super.message = ''});
}

class InvalidParamsFailure extends Failure {
  InvalidParamsFailure({
    required this.errors,
    super.message = '',
  });

  dynamic errors;
}

class ServerErrorFailure extends Failure {
  ServerErrorFailure({super.message = ''});
}

class TimeoutFailure extends Failure {
  TimeoutFailure({
    super.message,
  });
}
