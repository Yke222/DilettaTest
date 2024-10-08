import 'package:diletta_shop/core/failures/failures.dart';
import 'package:diletta_shop/shared/services/http/dio_http_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late DioHttpService dioHttpService;
  late Dio mockDio;
  const String url = "https://api.example.com/data";

  setUp(() {
    mockDio = MockDio();
    dioHttpService = DioHttpService(dio: mockDio);
  });

  group("Given a HttpService", () {
    group("When is making a GET request", () {
      test("then should return HttpResult on successful GET request", () async {
        // Arrange
        final responseData = {'key': 'value'};
        final response = Response(
          data: responseData,
          statusCode: 200,
          requestOptions: RequestOptions(path: url),
        );

        when(() => mockDio.get(url, options: any(named: "options")))
            .thenAnswer((_) async => response);

        // Act
        final result = await dioHttpService.get(url);

        // Assert
        expect(result.data, responseData);
        expect(result.statusCode, 200);
      });

      test("then should return HttpResult with failure on GET request failure",
          () async {
        // Arrange
        final dioError = DioException(
          requestOptions: RequestOptions(path: url),
          response: Response(
            data: {'error': 'Not Found'},
            statusCode: 404,
            requestOptions: RequestOptions(path: url),
          ),
          type: DioExceptionType.badResponse,
        );

        when(() => mockDio.get(url, options: any(named: 'options')))
            .thenThrow(dioError);

        // Act
        final result = await dioHttpService.get(url);

        // Assert
        expect(result.data, {'error': 'Not Found'});
      });

      test(
          'then should return HttpResult with NetworkFailure on unexpected error',
          () async {
        // Arrange
        final unexpectedError = Exception('Unexpected error');

        when(() => mockDio.get(url, options: any(named: 'options')))
            .thenThrow(unexpectedError);

        // Act
        final result = await dioHttpService.get(url);

        // Assert
        expect(result.data, isA<NetworkFailure>());
        expect(result.statusCode, 500);
      });
    });
  });
}
