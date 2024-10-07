import 'package:dartz/dartz.dart';
import 'package:wishlist/features/product/domain/entities/product_entity.dart';
import 'package:wishlist/features/product/domain/repositories/product_repository.dart';
import 'package:wishlist/utils/errors/failure.dart';
import 'package:wishlist/utils/usecases/usecase.dart';

class FetchProductsUseCase implements UseCase<Either<Failure, List<ProductEntity>>, dynamic> {
  final ProductRepository _productRepository;

  FetchProductsUseCase(this._productRepository);

  @override
  Future<Either<Failure, List<ProductEntity>>> call({dynamic params}) async {
    return await _productRepository.fetchProducts();
  }
}
