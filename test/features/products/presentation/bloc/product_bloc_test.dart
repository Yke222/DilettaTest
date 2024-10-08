import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:diletta_shop/core/failures/failures.dart';
import 'package:diletta_shop/core/usecases/usecase.dart';
import 'package:diletta_shop/features/products/data/models/product_model.dart';
import 'package:diletta_shop/features/products/domain/usecases/fetch_products.dart';
import 'package:diletta_shop/features/products/domain/usecases/fetch_wishlist.dart';
import 'package:diletta_shop/features/products/domain/usecases/save_to_wishlist.dart';
import 'package:diletta_shop/features/products/presentation/bloc/product_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../mocks.dart';

class MockFetchProducts extends Mock implements FetchProducts {}
class MockFetchWishlist extends Mock implements FetchWishlist {}
class MockSaveToWishlist extends Mock implements SaveToWishlist {}
class NoParamsFake extends Fake implements NoParams {}
class ProductModelFake extends Fake implements ProductModel {}

void main() {
  late ProductBloc productBloc;
  late FetchProducts mockFetchProducts;
  late FetchWishlist mockFetchWishlist;
  late SaveToWishlist mockSaveToWishlist;

  setUpAll(() {
    registerFallbackValue(NoParamsFake());
    registerFallbackValue(ProductModelFake());
  });

  setUp(() {
    mockFetchProducts = MockFetchProducts();
    mockFetchWishlist = MockFetchWishlist();
    mockSaveToWishlist = MockSaveToWishlist();
    productBloc = ProductBloc(
      fetchProducts: mockFetchProducts,
      fetchWishlist: mockFetchWishlist,
      saveToWishlist: mockSaveToWishlist,
    );
  });

  group("Given a ProductBloc", () {
    group("When initialized", () {
      test("Then the initial state is ProductInitialState", () {
        expect(productBloc.state, const ProductInitialState());
      });
    });

    group("When is fetching products", () {
      blocTest<ProductBloc, ProductState>(
        "then emits [ProductLoadingState, ProductLoadedState] when FetchProductsEvent is added and data is fetched successfully",
        build: () {
          when(() => mockFetchProducts(any()))
              .thenAnswer((_) async => Right(productList));
          return productBloc;
        },
        act: (bloc) => bloc.add(const FetchProductsEvent()),
        expect: () => [
          const ProductLoadingState(),
          ProductLoadedState(products: productList),
        ],
        verify: (_) {
          verify(() => mockFetchProducts(any())).called(1);
        },
      );

      blocTest<ProductBloc, ProductState>(
        "then emits [ProductLoadingState, ProductErrorState] when FetchProductsEvent is added and fetching fails",
        build: () {
          when(() => mockFetchProducts(any()))
              .thenAnswer((_) async => const Left(ServerFailure("")));
          return productBloc;
        },
        act: (bloc) => bloc.add(const FetchProductsEvent()),
        expect: () => [
          const ProductLoadingState(),
          isA<ProductErrorState>(),
        ],
        verify: (_) {
          verify(() => mockFetchProducts(any())).called(1);
        },
      );
    });

    group("When is fetching wishlist", () {
      blocTest<ProductBloc, ProductState>(
        "then emits [ProductWishlistLoadingState, ProductWishlistLoadedState] when FetchWishlistEvent is added and wishlist is fetched successfully",
        build: () {
          when(() => mockFetchWishlist(any()))
              .thenAnswer((_) async => Right(wishlist));
          return productBloc;
        },
        act: (bloc) => bloc.add(const FetchWishlistEvent()),
        expect: () => [
          const ProductWishlistLoadingState(),
          ProductWishlistLoadedState(products: wishlist),
        ],
        verify: (_) {
          verify(() => mockFetchWishlist(any())).called(1);
        },
      );

      blocTest<ProductBloc, ProductState>(
        "then emits [ProductWishlistLoadingState, ProductWishlistErrorState] when FetchWishlistEvent is added and fetching wishlist fails",
        build: () {
          when(() => mockFetchWishlist(any())).thenAnswer((_) async =>
              const Left(CacheFailure('Failed to fetch wishlist')));
          return productBloc;
        },
        act: (bloc) => bloc.add(const FetchWishlistEvent()),
        expect: () => [
          const ProductWishlistLoadingState(),
         isA<ProductWishlistErrorState>(),
        ],
        verify: (_) {
          verify(() => mockFetchWishlist(any())).called(1);
        },
      );
    });

    group("When is adding a product to wishlist", () {
      blocTest<ProductBloc, ProductState>(
        "then emits [ProductWishlistLoadingState, ProductWishlistAddedState] when AddToWishlistEvent is added and product is added successfully",
        build: () {
          when(() => mockSaveToWishlist(any()))
              .thenAnswer((_) async => const Right(true));
          return productBloc;
        },
        act: (bloc) => bloc.add(AddToWishlistEvent(product: productList[0])),
        expect: () => [
          const ProductWishlistLoadingState(),
          const ProductWishlistAddedState(products: []),
        ],
        verify: (_) {
          verify(() => mockSaveToWishlist(any())).called(1);
        },
      );

      blocTest<ProductBloc, ProductState>(
        "then emits [ProductWishlistLoadingState, ProductWishlistErrorState] when AddToWishlistEvent is added and adding product fails",
        build: () {
          when(() => mockSaveToWishlist(any())).thenAnswer((_) async =>
              const Left(CacheFailure('Failed to add to wishlist')));
          return productBloc;
        },
        act: (bloc) => bloc.add(AddToWishlistEvent(product: productList[0])),
        expect: () => [
          const ProductWishlistLoadingState(),
          isA<ProductWishlistErrorState>(),
        ],
        verify: (_) {
          verify(() => mockSaveToWishlist(any())).called(1);
        },
      );
    });
  });
}
