class ClientException implements Exception {
  ClientException({this.message = ''});

  final String message;
}