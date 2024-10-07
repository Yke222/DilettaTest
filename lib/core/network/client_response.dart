class ClientResponse {
  ClientResponse({required this.statusCode, required this.body});

  final int statusCode;
  final dynamic body;

  ClientResponse copyWith({int? statusCode, String? message, dynamic data}) {
    return ClientResponse(
      statusCode: statusCode ?? this.statusCode,
      body: body,
    );
  }
}
