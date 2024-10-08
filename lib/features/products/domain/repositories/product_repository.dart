import 'package:dartz/dartz.dart';
import 'package:diletta_shop/core/failures/failures.dart';
import 'package:diletta_shop/features/products/data/models/product_model.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductModel>>> getProducts();
  Future<Either<Failure, bool>> addToWishlist(ProductModel product);
  Future<Either<Failure, List<ProductModel>>> getWishlist();
}