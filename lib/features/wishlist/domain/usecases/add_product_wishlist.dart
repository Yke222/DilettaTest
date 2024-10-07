import 'package:dartz/dartz.dart';
import 'package:wishlist/features/wishlist/communs/erros/wishlist_erros.dart';
import 'package:wishlist/features/wishlist/domain/entities/wish_product_entity.dart';
import 'package:wishlist/features/wishlist/domain/repositories/wishlist_repository.dart';
import 'package:wishlist/utils/errors/failure.dart';
import 'package:wishlist/utils/usecases/usecase.dart';

class AddProductWishListUseCase
    implements UseCase<Either<Failure, WishProductEntity>, WishProductEntity> {
  final WishListRepository _wishListRepository;

  AddProductWishListUseCase(this._wishListRepository);

  @override
  Future<Either<Failure, WishProductEntity>> call({WishProductEntity? params}) async {
    if (params == null) {
      return Left(Failure(NotFoundProductsException()));
    }
    return await _wishListRepository.addProductToWishList(params);
  }
}
