import 'package:dartz/dartz.dart';
import 'package:diletta_shop/core/failures/failures.dart';
import 'package:diletta_shop/core/usecases/usecase.dart';
import 'package:diletta_shop/features/products/domain/repositories/product_repository.dart';
import 'package:diletta_shop/features/products/domain/usecases/fetch_products.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks.dart';

class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  late ProductRepository mockProductRepository;
  late FetchProducts fetchProducts;

  setUp(() {
    mockProductRepository = MockProductRepository();
    fetchProducts = FetchProducts(productRepository: mockProductRepository);
  });

  group("Given a FetchProducts Usecase", () {
    group("When is called", () {
      test("then should return a list of products", () async {
        when(() => mockProductRepository.getProducts())
            .thenAnswer((_) async => Right(productList));

        final result = await fetchProducts(NoParams());

        expect(result, Right(productList));
      });

      test("then should return a failure on fetching products failure",
          () async {
        when(() => mockProductRepository.getProducts())
            .thenAnswer((_) async => const Left(ServerFailure("")));

        final result = await fetchProducts(NoParams());

        expect(result, const Left(ServerFailure("")));
      });
    });
  });
}
