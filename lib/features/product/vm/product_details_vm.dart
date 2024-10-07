import 'package:diletta_test/features/homepage/model/data/product.dart';
import 'package:diletta_test/features/wishlist/model/data/wishlist_item.dart';
import 'package:flutter/cupertino.dart';

import '../../wishlist/model/repository/wishlist_repository.dart';

class ProductDetailsViewModel {
  ProductDetailsViewModel(this.repository);

  final WishlistRepository repository;

  final ValueNotifier<bool> _productAdded = ValueNotifier<bool>(false);
  ValueNotifier<bool> get productAdded => _productAdded;

  Future<void> addItemOnWishlist(Product product) async {
    await repository.addItem(WishlistItem.fromProduct(product));
    _productAdded.value = true;
  }

  Future<void> checkIfItemIsOnWishList(Product product) async {
    _productAdded.value = await repository.isInWishlist(product.id);
  }

  void dispose() {
    _productAdded.dispose();
  }
}
