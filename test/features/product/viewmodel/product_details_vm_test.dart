import 'package:diletta_test/features/product/vm/product_details_vm.dart';
import 'package:diletta_test/features/wishlist/model/repository/wishlist_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../homepage/model/data/product_fixture.dart';
import '../../wishlist/viewmodel/wishlist_vm_test.mocks.dart';

@GenerateMocks([WishlistRepository])
void main() {
  late MockWishlistRepository mockRepository;
  late ProductDetailsViewModel viewModel;

  setUp(() {
    mockRepository = MockWishlistRepository();
    viewModel = ProductDetailsViewModel(mockRepository);
  });

  group('ProductDetailsViewModel', () {
    test('addItemOnWishlist should add an item to the wishlist and set productAdded to true', () async {
      final product = ProductFixture().build(1).first;

      when(mockRepository.addItem(any)).thenAnswer((_) async {});

      await viewModel.addItemOnWishlist(product);

      expect(viewModel.productAdded.value, isTrue);
      verify(mockRepository.addItem(any)).called(1);
    });

    test('checkIfItemIsOnWishList should set productAdded to true if product is in the wishlist', () async {
      final product = ProductFixture().build(1).first;

      when(mockRepository.isInWishlist(product.id)).thenAnswer((_) async => true);

      await viewModel.checkIfItemIsOnWishList(product);

      expect(viewModel.productAdded.value, isTrue);
      verify(mockRepository.isInWishlist(product.id)).called(1);
    });

    test('checkIfItemIsOnWishList should set productAdded to false if product is not in the wishlist', () async {
      final product = ProductFixture().build(1).first;

      when(mockRepository.isInWishlist(product.id)).thenAnswer((_) async => false);

      await viewModel.checkIfItemIsOnWishList(product);

      expect(viewModel.productAdded.value, isFalse);
      verify(mockRepository.isInWishlist(product.id)).called(1);
    });
  });
}
