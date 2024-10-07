import 'package:dartz/dartz.dart';
import 'package:wishlist/features/product/data/models/product_model.dart';
import 'package:wishlist/utils/errors/failure.dart';

abstract class FakeStoreApiDataSource {
  Future<Either<Failure, List<ProductModel>>> fetchProducts();
}