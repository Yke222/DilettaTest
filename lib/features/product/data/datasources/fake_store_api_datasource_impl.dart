import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wishlist/features/product/communs/erros/product_erros.dart';
import 'package:wishlist/features/product/data/datasources/fake_store_api_datasource.dart';
import 'package:wishlist/features/product/data/models/product_model.dart';
import 'package:wishlist/utils/errors/failure.dart';

class FakeStoreApiDataSourceImpl implements FakeStoreApiDataSource {
  @override
  Future<Either<Failure, List<ProductModel>>> fetchProducts() async {
    try {
      final dio = Dio();
      final response = await dio.get('https://fakestoreapi.com/products');

      if (response.statusCode == 200) {
        final List<ProductModel> products =
            (response.data as List).map((product) => ProductModel.fromJson(product)).toList();
        return Right(products);
      } else {
        return Left(Failure(NotFoundProductsException()));
      }
    } catch (e) {
      log('Error: $e');
      return Left(Failure(SearchProductsException()));
    }
  }
}
