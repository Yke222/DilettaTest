import 'package:diletta_test/core/di/setup_locator.dart';
import 'package:diletta_test/core/impl/dio/dio_get_client.dart';
import 'package:diletta_test/features/homepage/model/repository/products_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'products_repository_test.mocks.dart';

@GenerateMocks([DioGetClient])
void main() {
  late ProductsRepository repository;
  late MockDioGetClient mockGetClient;

  setUp(() {
    mockGetClient = MockDioGetClient();
    repository = ProductsRepository(getClient: mockGetClient);
  });

  tearDown(() {
    getIt.reset();
  });

  final mockProductsData = {
    'results': [
      {
        'id': 1,
        'title': 'Mock Product 1',
        'price': 19.99,
        'description': 'This is a mock description for product 1.',
        'category': 'Mock Category 1',
        'image': 'https://example.com/mock-image-1.png',
        'rating': {
          'rate': 4.5,
          'count': 100,
        },
      },
      {
        'id': 2,
        'title': 'Mock Product 2',
        'price': 29.99,
        'description': 'This is a mock description for product 2.',
        'category': 'Mock Category 2',
        'image': 'https://example.com/mock-image-2.png',
        'rating': {
          'rate': 3.8,
          'count': 50,
        },
      },
    ],
  };

  final mockCategoriesData = {
    ['men', 'women', 'kids']
  };

  group('ProductsRepository', () {
    test('call getItems and handle success', () async {
      when(mockGetClient.get(
        url: '/products',
      )).thenAnswer((_) async => mockProductsData);

      final result = await repository.fetchProducts();

      expect(result, equals(mockProductsData));
      verify(mockGetClient.get(
        url: '/products',
      )).called(1);
    });

    test('call getItems and handle error', () async {
      final exception = Exception('Network error');

      when(mockGetClient.get(url: '/products')).thenThrow(exception);

      expect(
        () async => await repository.fetchProducts(),
        throwsA(isA<Exception>()),
      );

      verify(mockGetClient.get(
        url: '/products',
      )).called(1);
    });

    test('call fetchCategories and handle success', () async {
      when(mockGetClient.get(
        url: '/products/categories',
      )).thenAnswer((_) async => mockCategoriesData);

      final result = await repository.fetchCategories();

      expect(result, equals(mockCategoriesData));
      verify(mockGetClient.get(
        url: '/products/categories',
      )).called(1);
    });

    test('call fetchCategories and handle error', () async {
      final exception = Exception('Network error');

      when(mockGetClient.get(url: '/products/categories')).thenThrow(exception);

      expect(
        () async => await repository.fetchCategories(),
        throwsA(isA<Exception>()),
      );

      verify(mockGetClient.get(
        url: '/products/categories',
      )).called(1);
    });
  });
}
