import 'package:diletta_test/core/impl/database/local_db.dart';
import 'package:hive/hive.dart';

import '../data/wishlist_item.dart';

class WishlistRepository {
  WishlistRepository(this._localDb);

  final LocalDb _localDb;
  final String _boxName = 'wishList';

  Future<Box<WishlistItem>> get _box async => await Hive.openBox<WishlistItem>(_boxName);

  Future<List<WishlistItem>?> getItems() async {
    final result = await _localDb.getAllItems<WishlistItem>(box: _box);
    return result;
  }

  Future<void> addItem(WishlistItem item) async {
    await _localDb.insertItem<WishlistItem>(key: item.productId, item: item, box: _box);
  }

  Future<void> removeItem(int index) async {
    await _localDb.deleteItem<WishlistItem>(key: index, box: _box);
  }

  Future<bool> isInWishlist(int productId) async {
    final result = await _localDb.contains<WishlistItem>(id: productId, box: _box);
    return result;
  }

  Future<void> clearWishList() async {
    await _localDb.clear(box: _box);
  }
}
