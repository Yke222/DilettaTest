import 'package:dartz/dartz.dart';
import 'package:wishlist/features/wishlist/communs/erros/wishlist_erros.dart';
import 'package:wishlist/features/wishlist/domain/repositories/wishlist_repository.dart';
import 'package:wishlist/utils/errors/failure.dart';
import 'package:wishlist/utils/usecases/usecase.dart';

class RemoveProductWishListUseCase implements UseCase<Either<Failure, bool>, int> {
  final WishListRepository _wishListRepository;

  RemoveProductWishListUseCase(this._wishListRepository);

  @override
  Future<Either<Failure, bool>> call({int? params}) async {
    if (params == null) {
      return Left(Failure(NotFoundProductsException()));
    }
    return await _wishListRepository.removeProductFromWishList(params);
  }
}
