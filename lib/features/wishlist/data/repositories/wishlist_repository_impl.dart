import 'package:dartz/dartz.dart';
import 'package:wishlist/features/wishlist/data/datasources/firebase_store_datasource_impl.dart';
import 'package:wishlist/features/wishlist/data/models/wish_product_model.dart';
import 'package:wishlist/features/wishlist/domain/entities/wish_product_entity.dart';
import 'package:wishlist/features/wishlist/domain/repositories/wishlist_repository.dart';
import 'package:wishlist/utils/errors/failure.dart';

class WishlistRepositoryImpl implements WishListRepository {
  final AuthFirebaseWishListDataSourceImpl _authFirebaseWishListDataSourceImpl;

  WishlistRepositoryImpl(this._authFirebaseWishListDataSourceImpl);

  @override
  Future<Either<Failure, WishProductEntity>> addProductToWishList(WishProductEntity product) async {
    final result = await _authFirebaseWishListDataSourceImpl.addProductToWishList(
      WishProductModel.fromEntity(product),
    );

    return result.fold(
      (l) => Left(l),
      (r) => Right(r.toEntity()),
    );
  }

  @override
  Future<Either<Failure, List<WishProductEntity>>> fetchProducts() async {
    return await _authFirebaseWishListDataSourceImpl.fetchProducts();
  }

  @override
  Future<Either<Failure, bool>> removeProductFromWishList(
    int productId,
  ) async {

    return await _authFirebaseWishListDataSourceImpl.removeProductFromWishList(productId);
  }
}
