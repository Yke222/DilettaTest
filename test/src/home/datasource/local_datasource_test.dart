import 'package:diletta_challenge/src/home/home.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late LocalDatasource datasource;

  setUpAll(() async {
    datasource = LocalDatasource();
  });

  const item = StarShipResponseDTO(
    name: 'name',
    model: 'model',
    costInCredits: 'costInCredits',
    length: 'length',
    maxAtmospheringSpeed: 'maxAtmospheringSpeed',
    passengers: 'passengers',
    cargoCapacity: 'cargoCapacity',
    starshipClass: 'starshipClass',
  );

  group('LocalDataSource test', () {
    test('Wish List Init Empty', () async {
      expect(datasource.wishlist.isEmpty, true);
    });

    test('Add Item to Wishlist', () async {
      datasource.addToWishList(item);
      expect(datasource.wishlist.isNotEmpty, true);
    });

     test('Remove Item from Wishlist', () async {
      datasource.addToWishList(item);
      datasource.removeFromWishList(item);
      expect(datasource.wishlist.isEmpty, true);
    });

    test('Retrieve Wishlist', () async {
      final wishlist = datasource.fetchWishList();
      expect(wishlist.isEmpty, true);
    });

  });
}
