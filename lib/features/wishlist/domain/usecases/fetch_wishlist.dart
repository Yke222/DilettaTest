import 'package:dartz/dartz.dart';
import 'package:wishlist/features/wishlist/domain/entities/wish_product_entity.dart';
import 'package:wishlist/features/wishlist/domain/repositories/wishlist_repository.dart';
import 'package:wishlist/utils/errors/failure.dart';
import 'package:wishlist/utils/usecases/usecase.dart';

class FetchWishListUseCase implements UseCase<Either<Failure, List<WishProductEntity>>, dynamic> {
  final WishListRepository _wishListRepository;

  FetchWishListUseCase(this._wishListRepository);

  @override
  Future<Either<Failure, List<WishProductEntity>>> call({dynamic params}) async {
    return await _wishListRepository.fetchProducts();
  }
}
