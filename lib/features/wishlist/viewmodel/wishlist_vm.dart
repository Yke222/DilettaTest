import 'package:diletta_test/features/homepage/model/data/product.dart';
import 'package:flutter/material.dart';

import '../model/repository/wishlist_repository.dart';

class WishlistViewModel {
  WishlistViewModel(this.repository);

  final WishlistRepository repository;

  final ValueNotifier<List<Product>> _productsOnWishlist = ValueNotifier<List<Product>>([]);

  ValueNotifier<List<Product>> get productsOnWishlist => _productsOnWishlist;

  Future<void> getProductsOnWishlist() async {
    final result = await repository.getItems();
    final products = result?.map((item) => Product.toProduct(item)).toList() ?? [];
    _productsOnWishlist.value = products;
  }

  Future<void> removeProduct(int index) async {
    await repository.removeItem(index);
    final updatedList = List<Product>.from(_productsOnWishlist.value)..removeAt(index);
    _productsOnWishlist.value = updatedList;
  }

  Future<void> clearWishlist() async {
    if (_productsOnWishlist.value.isEmpty) return;
    await repository.clearWishList();
    _productsOnWishlist.value.clear();
    _productsOnWishlist.value = [];
  }

  void dispose() {
    _productsOnWishlist.dispose();
  }
}
