import 'package:diletta_test/features/homepage/model/data/product.dart';
import 'package:flutter/cupertino.dart';
import '../../../core/di/setup_locator.dart';
import '../../../core/helpers/l10n_helper.dart';
import '../model/repository/products_repository.dart';

class HomeViewModel {
  HomeViewModel(this.repository);

  final ProductsRepository repository;
  final _appStrings = getIt.get<AppStrings>().l10n;

  final ValueNotifier<bool> _isLoading = ValueNotifier<bool>(false);

  ValueNotifier<bool> get isLoading => _isLoading;

  final ValueNotifier<bool> _error = ValueNotifier<bool>(false);

  ValueNotifier<bool> get error => _error;

  final ValueNotifier<List<Product>> _products = ValueNotifier<List<Product>>([]);

  ValueNotifier<List<Product>> get products => _products;

  final ValueNotifier<List<String>> _categories = ValueNotifier<List<String>>([]);

  ValueNotifier<List<String>> get categories => _categories;

  List<Product> currentProducts = [];

  Future<void> fetchProducts() async {
    _isLoading.value = true;
    try {
      final productsList = await repository.fetchProducts();
      currentProducts = productsList.map<Product>((item) => Product.fromJson(item)).toList();
      _error.value = false;
      _products.value = currentProducts;
    } catch (e) {
      _error.value = true;
    } finally {
      _isLoading.value = false;
    }
  }

  Future<void> fetchCategories() async {
    _isLoading.value = true;
    try {
      final categoriesList = await repository.fetchCategories();
      _error.value = false;
      _categories.value = [_appStrings.all, ...List<String>.from(categoriesList)];
    } catch (e) {
      _error.value = true;
    } finally {
      _isLoading.value = false;
    }
  }

  Future<void> filterItemsPerCategory(String category) async {
    if (category == _appStrings.all) {
      _products.value = currentProducts;
      return;
    }
    _products.value = currentProducts.where((item) => item.category == category).toList();
  }

  void dispose() {
    _products.dispose();
    _categories.dispose();
    _isLoading.dispose();
  }
}
