import 'package:dartz/dartz.dart';
import 'package:wishlist/features/wishlist/data/models/wish_product_model.dart';
import 'package:wishlist/utils/errors/failure.dart';

abstract class AuthFirebaseWishListDataSource {
  Future<Either<Failure, WishProductModel>> addProductToWishList(WishProductModel product);
  Future<Either<Failure, List<WishProductModel>>> fetchProducts();
  Future<Either<Failure, bool>> removeProductFromWishList(int productId);
}
