abstract class Failure implements Exception {
  Failure({this.message = ''});

  String message;
}

class NoInternetFailure extends Failure {
  NoInternetFailure({
    super.message = '',
  });

  dynamic errors;
}

class ServerErrorFailure extends Failure {
  ServerErrorFailure({super.message = ''});
}
