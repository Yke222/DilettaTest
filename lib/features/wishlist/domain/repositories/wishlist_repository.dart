import 'package:dartz/dartz.dart';
import 'package:wishlist/features/wishlist/domain/entities/wish_product_entity.dart';
import 'package:wishlist/utils/errors/failure.dart';

abstract class WishListRepository {
  Future<Either<Failure, List<WishProductEntity>>> fetchProducts();
  Future<Either<Failure, WishProductEntity>> addProductToWishList(WishProductEntity product);
  Future<Either<Failure, bool>> removeProductFromWishList(int productId);
}
