import 'dart:async';
import 'package:diletta_test/core/di/setup_locator.dart';
import 'package:diletta_test/core/helpers/l10n_helper.dart';
import 'package:diletta_test/features/homepage/model/repository/products_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:diletta_test/features/homepage/viewmodel/home_vm.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/mock_app_strings.dart';
import '../model/data/product_fixture.dart';
import 'home_vm_test.mocks.dart';

@GenerateMocks([ProductsRepository])
void main() {
  late HomeViewModel viewModel;
  late MockProductsRepository repository;

  setUp(() {
    repository = MockProductsRepository();
    getIt.registerSingleton<AppStrings>(MockAppStrings());
    viewModel = HomeViewModel(repository);
  });

  tearDown(() {
    getIt.reset();
  });

  group('HomeViewModel', () {
    group('fetchProducts', () {
      test('handle success', () async {
        final completer = Completer<List<Map<String, dynamic>>>();

        when(repository.fetchProducts()).thenAnswer((_) => completer.future);

        final fetchProducts = viewModel.fetchProducts();
        expect(viewModel.isLoading.value, isTrue);

        completer.complete(ProductFixture().buildJsonString(3));

        await fetchProducts;

        expect(viewModel.isLoading.value, isFalse);
        verify(repository.fetchProducts()).called(1);
        expect(viewModel.products.value.length, equals(3));
      });
      test('handle error', () async {
        final completer = Completer<Exception>();

        when(repository.fetchProducts()).thenAnswer((_) => completer.future);

        final fetchProducts = viewModel.fetchProducts();
        expect(viewModel.isLoading.value, isTrue);

        completer.complete(Exception('No internet connection'));

        await fetchProducts;

        expect(viewModel.isLoading.value, isFalse);
        expect(viewModel.error.value, isTrue);
        verify(repository.fetchProducts()).called(1);
        expect(viewModel.products.value.length, equals(0));
      });
    });
    group('fetchCategories', () {
      test('handle success', () async {
        final completer = Completer<List<String>>();
        when(repository.fetchCategories()).thenAnswer((_) => completer.future);

        final fetchCategories = viewModel.fetchCategories();

        expect(viewModel.isLoading.value, isTrue);

        completer.complete(['Category1', 'Category2']);

        await fetchCategories;

        expect(viewModel.isLoading.value, isFalse);
        expect(viewModel.categories.value, equals(['Todas', 'Category1', 'Category2']));
      });
      test('handle error', () async {
        final completer = Completer<Exception>();

        when(repository.fetchCategories()).thenAnswer((_) => completer.future);

        final fetchCategories = viewModel.fetchCategories();
        expect(viewModel.isLoading.value, isTrue);

        completer.complete(Exception('No internet connection'));

        await fetchCategories;

        expect(viewModel.isLoading.value, isFalse);
        expect(viewModel.error.value, isTrue);
        verify(repository.fetchCategories()).called(1);
        expect(viewModel.products.value.length, equals(0));
      });
    });
    group('filterItemsPerCategory', () {
      test('handle when no category is selected', () async {
        viewModel.currentProducts = ProductFixture().build(3);

        await viewModel.filterItemsPerCategory('Todas');

        expect(viewModel.products.value.length, equals(3));
      });

      test('handle when category is selected', () async {
        viewModel.currentProducts = ProductFixture().build(3);
        final category = (0 % 3) + 1;

        await viewModel.filterItemsPerCategory('Mock Category $category');

        expect(viewModel.products.value.length, equals(1));
      });

    });
  });
}
