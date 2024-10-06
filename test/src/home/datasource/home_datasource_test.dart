import 'package:diletta_challenge/core/core.dart';
import 'package:diletta_challenge/src/home/home.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockApiClient extends Mock implements HttpClient {}

final mockEmptyJson = {
  'results': [],
};

final mockJson = {
  'results': [
    {
      'name': 'CR90 corvette',
      'model': 'CR90 corvette',
      'cost_in_credits': '3500000',
      'length': '150',
      'max_atmosphering_speed': '950',
      'passengers': '600',
      'cargo_capacity': '3000000',
      'starship_class': 'corvette',
    }
  ],
};

void main() {
  late MockApiClient mockClient;
  late HomeDatasource datasource;

  final request = HttpRequest(
    method: RequestTypeEnum.get.name,
    path: HomeDataSourceRoutes.starChips,
  );

  final responseEmptySuccess = HttpResponse(
    statusCode: 200,
    data: mockEmptyJson,
  );
  final responseSuccess = HttpResponse(
    statusCode: 200,
    data: mockJson,
  );

  setUpAll(() async {
    mockClient = MockApiClient();

    datasource = HomeDatasource(
      httpClient: mockClient,
    );

    registerFallbackValue(request);
    registerFallbackValue(responseSuccess);
  });

  group('HomeDatasource FetchStarChipsList Tests', () {
    test('Empty List Success', () async {
      when(() => mockClient.doRequest(any())).thenAnswer(
        (_) async => responseEmptySuccess,
      );

      final result = await datasource.fetchStarChipsList();

      expect(result.isEmpty, true);
      verify(() => mockClient.doRequest(any())).called(1);
      verifyNoMoreInteractions(mockClient);
    });

    test('NotEmpty List Success', () async {
      when(() => mockClient.doRequest(any())).thenAnswer(
        (_) async => responseSuccess,
      );

      final result = await datasource.fetchStarChipsList();

      expect(result.isEmpty, false);
      verify(() => mockClient.doRequest(any())).called(1);
      verifyNoMoreInteractions(mockClient);
    });
  });
}
