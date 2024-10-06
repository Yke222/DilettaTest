import 'package:diletta_challenge/core/core.dart';
import 'package:diletta_challenge/src/home/home.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRepository extends Mock implements IHomeRepository {}

void main() {
  late HomeCubit cubit;
  late IHomeRepository homeRepository;

  final List<StarShipEntity> emptyList = [];

  final failure = ServerErrorFailure();

  const entity = StarShipEntity(
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
    entity,
  ];

  setUp(() async {
    homeRepository = MockRepository();

    cubit = HomeCubit(
      repository: homeRepository,
    );

    registerFallbackValue(entity);
  });

  group('HomeCubit Tests', () {
    test('initial state', () {
      expect(cubit.state, isA<HomeState>());
    });

    group('FetchListStarShips Tests', () {
      test('Success - Empty List', () async {
        when(() => homeRepository.fetchListStarShips()).thenAnswer(
          (_) async => (null, emptyList),
        );

        await cubit.fetchListStarships();

        expect(cubit.state.listStarships.isEmpty, true);
        expect(cubit.state.fetchListStarshipsStatus.isSuccess, true);
        verify(() => homeRepository.fetchListStarShips()).called(1);
        verifyNoMoreInteractions(homeRepository);
      });

      test('Success - Not Empty List', () async {
        when(() => homeRepository.fetchListStarShips()).thenAnswer(
          (_) async => (null, list),
        );

        await cubit.fetchListStarships();

        expect(cubit.state.listStarships.isEmpty, false);
        expect(cubit.state.fetchListStarshipsStatus.isSuccess, true);
        expect(cubit.state.listStarships.first, isA<StarShipEntity>());
        expect(cubit.state.failure, isA());
        verify(() => homeRepository.fetchListStarShips()).called(1);
        verifyNoMoreInteractions(homeRepository);
      });

      test('Error', () async {
        when(() => homeRepository.fetchListStarShips()).thenAnswer(
          (_) async => (failure, null),
        );

        await cubit.fetchListStarships();

        expect(cubit.state.listStarships.isEmpty, true);
        expect(cubit.state.fetchListStarshipsStatus.isError, true);
        expect(cubit.state.failure, isA<Failure>());
        verify(() => homeRepository.fetchListStarShips()).called(1);
        verifyNoMoreInteractions(homeRepository);
      });
    });

    group('FetchWishlist Tests', () {
      test('Success - Empty List', () {
        when(() => homeRepository.fetchWishList()).thenAnswer(
          (_) => (null, emptyList),
        );

        cubit.fetchWishlist();

        expect(cubit.state.wishlist.isEmpty, true);
        expect(cubit.state.fetchWishlistStatus.isSuccess, true);
        verify(() => homeRepository.fetchWishList()).called(1);
        verifyNoMoreInteractions(homeRepository);
      });

      test('Success - Not Empty List', () {
        when(() => homeRepository.fetchWishList()).thenAnswer(
          (_) => (null, list),
        );

        cubit.fetchWishlist();

        expect(cubit.state.wishlist.isEmpty, false);
        expect(cubit.state.wishlist.first, isA<StarShipEntity>());
        expect(cubit.state.fetchWishlistStatus.isSuccess, true);
        expect(cubit.state.failure, isA());
        verify(() => homeRepository.fetchWishList()).called(1);
        verifyNoMoreInteractions(homeRepository);
      });

      test('Error', () {
        when(() => homeRepository.fetchWishList()).thenAnswer(
          (_) => (failure, null),
        );

        cubit.fetchWishlist();

        expect(cubit.state.wishlist.isEmpty, true);
        expect(cubit.state.fetchWishlistStatus.isError, true);
        expect(cubit.state.failure, isA<Failure>());
        verify(() => homeRepository.fetchWishList()).called(1);
        verifyNoMoreInteractions(homeRepository);
      });
    });

    group('AddToWishlist Tests', () {
      test('Success', () {
        when(() => homeRepository.addToWishList(any())).thenAnswer(
          (_) => null,
        );

        cubit.addToWishlist(entity);

        expect(cubit.state.wishlist.isEmpty, true);
        expect(cubit.state.updatehWishlistStatus.isSuccess, true);
        verify(() => homeRepository.addToWishList(any())).called(1);
        verifyNoMoreInteractions(homeRepository);
      });

      test('Error', () {
        when(() => homeRepository.addToWishList(any())).thenAnswer(
          (_) => failure,
        );

        cubit.addToWishlist(entity);

        expect(cubit.state.wishlist.isEmpty, true);
        expect(cubit.state.updatehWishlistStatus.isSuccess, false);
        expect(cubit.state.failure, isA());
        verify(() => homeRepository.addToWishList(any())).called(1);
        verifyNoMoreInteractions(homeRepository);
      });
    });

    group('RemoveFromWishlist Tests', () {
      test('Success', () {
        when(() => homeRepository.removeFromWishList(any())).thenAnswer(
          (_) => null,
        );

        cubit.removeFromWishlist(entity);

        expect(cubit.state.wishlist.isEmpty, true);
        expect(cubit.state.updatehWishlistStatus.isSuccess, true);
        verify(() => homeRepository.removeFromWishList(any())).called(1);
        verifyNoMoreInteractions(homeRepository);
      });

      test('Error', () {
        when(() => homeRepository.removeFromWishList(any())).thenAnswer(
          (_) => failure,
        );

        cubit.removeFromWishlist(entity);

        expect(cubit.state.wishlist.isEmpty, true);
        expect(cubit.state.updatehWishlistStatus.isSuccess, false);
        expect(cubit.state.failure, isA());
        verify(() => homeRepository.removeFromWishList(any())).called(1);
        verifyNoMoreInteractions(homeRepository);
      });
    });

    test('All Together Test', () async {
      when(() => homeRepository.fetchListStarShips()).thenAnswer(
        (_) async => (null, list),
      );
      when(() => homeRepository.addToWishList(any())).thenAnswer(
        (_) => null,
      );
      when(() => homeRepository.fetchWishList()).thenAnswer(
        (_) => (null, list),
      );

      await cubit.fetchListStarships();
      cubit.addToWishlist(entity);
      cubit.fetchWishlist();
      cubit.updateCurrentList();

      expect(cubit.state.listStarships.isEmpty, false);
      expect(cubit.state.wishlist.isEmpty, false);
      expect(cubit.state.fetchListStarshipsStatus.isSuccess, true);
    });
  });

  test('Filter Wishlist Test - Success', () async {
    when(() => homeRepository.fetchListStarShips()).thenAnswer(
      (_) async => (null, list),
    );
    when(() => homeRepository.addToWishList(any())).thenAnswer(
      (_) => null,
    );

    when(() => homeRepository.fetchWishList()).thenAnswer(
      (_) => (null, list),
    );

    await cubit.fetchListStarships();
    cubit.addToWishlist(entity);
    cubit.fetchWishlist();
    cubit.filterWishList('name');

    expect(cubit.state.filteredWishlist.isNotEmpty, true);

    cubit.filterWishList('teste');

    expect(cubit.state.filteredWishlist.isEmpty, true);

    verify(() => homeRepository.fetchListStarShips()).called(1);
    verify(() => homeRepository.addToWishList(any())).called(1);
    verify(() => homeRepository.fetchWishList()).called(1);
    verifyNoMoreInteractions(homeRepository);
  });
}
