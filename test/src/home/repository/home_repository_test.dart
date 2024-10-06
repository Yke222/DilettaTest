import 'package:diletta_challenge/core/core.dart';
import 'package:diletta_challenge/src/home/home.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDataSource extends Mock implements IHomeDatasource {}

class MockLocalDataSource extends Mock implements ILocalDatasource {}

void main() {
  late IHomeDatasource datasource;
  late ILocalDatasource localDatasource;
  late IHomeRepository homeRepository;

  const exception = ServerErrorException();

  final List<StarShipResponseDTO> emptyList = [];

  const dto = StarShipResponseDTO(
    name: 'name',
    model: 'model',
    costInCredits: 'costInCredits',
    length: 'length',
    maxAtmospheringSpeed: 'maxAtmospheringSpeed',
    passengers: 'passengers',
    cargoCapacity: 'cargoCapacity',
    starshipClass: 'starshipClass',
  );

  const list = [
    dto,
  ];

  setUpAll(() async {
    datasource = MockDataSource();
    localDatasource = MockLocalDataSource();

    homeRepository = HomeRepository(
      datasource: datasource,
      localDatasource: localDatasource,
    );

    registerFallbackValue(emptyList);
    registerFallbackValue(list);
    registerFallbackValue(exception);
    registerFallbackValue(dto);
  });

  group('IHomeRepository Tests', () {
    group('FetchListStarShips Tests', () {
      test('Success - Empty List', () async {
        when(() => datasource.fetchStarChipsList()).thenAnswer(
          (_) async => emptyList,
        );

        final (err, result) = await homeRepository.fetchListStarShips();

        expect(err, isA());
        expect(result, isNotNull);
        expect(result!.isEmpty, true);
        verify(() => datasource.fetchStarChipsList()).called(1);
        verifyNoMoreInteractions(datasource);
      });

      test('Success - Not Empty List', () async {
        when(() => datasource.fetchStarChipsList()).thenAnswer(
          (_) async => list,
        );

        final (err, result) = await homeRepository.fetchListStarShips();

        expect(err, isA());
        expect(result, isNotNull);
        expect(result!.isNotEmpty, true);
        verify(() => datasource.fetchStarChipsList()).called(1);
        verifyNoMoreInteractions(datasource);
      });

      test('Error', () async {
        when(() => datasource.fetchStarChipsList()).thenThrow(
          (_) async => exception,
        );

        final (err, result) = await homeRepository.fetchListStarShips();

        expect(err, isNotNull);
        expect(result, isA());

        verify(() => datasource.fetchStarChipsList()).called(1);
        verifyNoMoreInteractions(datasource);
      });
    });

    group('AddToWishList Tests', () {
      test('Success', () {
        when(() => localDatasource.addToWishList(dto)).thenAnswer(
          (_) => {},
        );

        final err = homeRepository.addToWishList(dto);

        expect(err, isA());
        verify(() => localDatasource.addToWishList(dto)).called(1);
        verifyNoMoreInteractions(localDatasource);
      });

      test('Error', () {
        when(() => localDatasource.addToWishList(dto)).thenThrow(
          (_) async => exception,
        );

        final err = homeRepository.addToWishList(dto);

        expect(err, isNotNull);
        verify(() => localDatasource.addToWishList(dto)).called(1);
        verifyNoMoreInteractions(localDatasource);
      });
    });

    group('FetchWishList Tests', () {
      test('Success', () {
        when(() => localDatasource.fetchWishList()).thenAnswer(
          (_) => emptyList,
        );

        final (err, list) = homeRepository.fetchWishList();

        expect(err, isA());
        expect(list, isNotNull);
        expect(list!.isEmpty, true);
        verify(() => localDatasource.fetchWishList()).called(1);
        verifyNoMoreInteractions(localDatasource);
      });

      test('Error', () {
        when(() => localDatasource.fetchWishList()).thenThrow(
          (_) async => exception,
        );

        final (err, list) = homeRepository.fetchWishList();

        expect(err, isNotNull);
        expect(list, isA());
        verify(() => localDatasource.fetchWishList()).called(1);
        verifyNoMoreInteractions(localDatasource);
      });
    });

    group('RemoveFromWishList Tests', () {
      test('Success', () {
        when(() => localDatasource.removeFromWishList(dto)).thenAnswer(
          (_) => {},
        );

        final err = homeRepository.removeFromWishList(dto);

        expect(err, isA());
        verify(() => localDatasource.removeFromWishList(dto)).called(1);
        verifyNoMoreInteractions(localDatasource);
      });

      test('Error', () {
        when(() => localDatasource.removeFromWishList(dto)).thenThrow(
          (_) async => exception,
        );

        final err = homeRepository.removeFromWishList(dto);

        expect(err, isNotNull);
        verify(() => localDatasource.removeFromWishList(dto)).called(1);
        verifyNoMoreInteractions(localDatasource);
      });
    });
  });
}
