import 'package:diletta_test/features/wishlist/model/repository/wishlist_repository.dart';
import 'package:diletta_test/features/wishlist/viewmodel/wishlist_vm.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../model/data/wishlist_item_fixture.dart';
import 'wishlist_vm_test.mocks.dart';

@GenerateMocks([WishlistRepository])
void main() {
  late WishlistViewModel viewModel;
  late MockWishlistRepository repository;

  setUp(() {
    repository = MockWishlistRepository();
    viewModel = WishlistViewModel(repository);
  });

  group('WishlistViewModel', () {
    test('handle wishlist products', () async {
      when(repository.getItems()).thenAnswer((_) async => WishlistItemFixture().build(3));
      await viewModel.getProductsOnWishlist();
      expect(viewModel.productsOnWishlist.value.length, equals(3));
    });

    test('removeProduct', () async {
      final initialItems = WishlistItemFixture().build(3);

      when(repository.getItems()).thenAnswer((_) async => initialItems);
      when(repository.removeItem(any)).thenAnswer((_) async {});

      await viewModel.getProductsOnWishlist();
      expect(viewModel.productsOnWishlist.value.length, equals(3));

      await viewModel.removeProduct(2);

      expect(viewModel.productsOnWishlist.value.length, equals(2));
      verify(repository.removeItem(2)).called(1);
    });

    test('clearWishlist', () async {
      final initialItems = WishlistItemFixture().build(3);
      when(repository.getItems()).thenAnswer((_) async => initialItems);
      when(repository.clearWishList()).thenAnswer((_) async {});

      await viewModel.getProductsOnWishlist();
      expect(viewModel.productsOnWishlist.value.length, equals(3));

      await viewModel.clearWishlist();

      expect(viewModel.productsOnWishlist.value.length, equals(0));
      verify(repository.clearWishList()).called(1);
    });
  });
}
