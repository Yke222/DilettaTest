import 'package:dartz/dartz.dart';
import 'package:diletta_shop/core/failures/failures.dart';
import 'package:diletta_shop/core/usecases/usecase.dart';
import 'package:diletta_shop/features/products/data/models/product_model.dart';
import 'package:diletta_shop/features/products/domain/repositories/product_repository.dart';

class SaveToWishlist implements UseCase<bool, ProductModel> {
  final ProductRepository _productRepository;

  SaveToWishlist({required ProductRepository productRepository})
      : _productRepository = productRepository;

  @override
  Future<Either<Failure, bool>> call(ProductModel params) {
    return _productRepository.addToWishlist(params);
  }
}