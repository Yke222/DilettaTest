import 'package:dartz/dartz.dart';
import 'package:wishlist/features/product/domain/entities/product_entity.dart';
import 'package:wishlist/utils/errors/failure.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductEntity>>> fetchProducts();
}