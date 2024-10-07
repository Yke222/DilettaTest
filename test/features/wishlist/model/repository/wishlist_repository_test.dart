import 'package:diletta_test/core/di/setup_locator.dart';
import 'package:diletta_test/core/impl/database/local_db.dart';
import 'package:diletta_test/features/wishlist/model/data/wishlist_item.dart';
import 'package:diletta_test/features/wishlist/model/repository/wishlist_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:hive_test/hive_test.dart';

import '../data/wishlist_item_fixture.dart';
import 'wishlist_repository_test.mocks.dart';

@GenerateMocks([LocalDb])
void main() {
  late MockLocalDb mockLocalDb;
  late WishlistRepository wishlistRepository;

  setUp(() async {
    mockLocalDb = MockLocalDb();
    await setUpTestHive();
    wishlistRepository = WishlistRepository(mockLocalDb);
  });

  tearDown(() async {
    await Hive.close();
    getIt.reset();
  });

  group('WishlistRepository', () {
    test('getItems should return list of wishlist items', () async {
      final wishlistItems = WishlistItemFixture().build(3);
      when(mockLocalDb.getAllItems<WishlistItem>(box: anyNamed('box'))).thenAnswer((_) async => wishlistItems);

      final result = await wishlistRepository.getItems();

      expect(result, equals(wishlistItems));
      verify(mockLocalDb.getAllItems<WishlistItem>(box: anyNamed('box'))).called(1);
    });

    test('addItem should add item to wishlist', () async {
      final wishlistItem = WishlistItemFixture().build(1).first;

      await wishlistRepository.addItem(wishlistItem);

      verify(mockLocalDb.insertItem<WishlistItem>(
        key: wishlistItem.productId,
        item: wishlistItem,
        box: anyNamed('box'),
      )).called(1);
    });

    test('removeItem should remove item from wishlist by index', () async {
      await wishlistRepository.removeItem(1);

      verify(mockLocalDb.deleteItem<WishlistItem>(key: 1, box: anyNamed('box'))).called(1);
    });

    test('isInWishlist should return true if item is in wishlist', () async {
      when(mockLocalDb.contains<WishlistItem>(id: 1, box: anyNamed('box'))).thenAnswer((_) async => true);

      final result = await wishlistRepository.isInWishlist(1);

      expect(result, isTrue);
      verify(mockLocalDb.contains<WishlistItem>(id: 1, box: anyNamed('box'))).called(1);
    });

    test('clearWishList should clear all items in wishlist', () async {
      await wishlistRepository.clearWishList();

      verify(mockLocalDb.clear(box: anyNamed('box'))).called(1);
    });
  });
}
