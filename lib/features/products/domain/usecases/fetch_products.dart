import 'package:dartz/dartz.dart';
import 'package:diletta_shop/core/failures/failures.dart';
import 'package:diletta_shop/core/usecases/usecase.dart';
import 'package:diletta_shop/features/products/data/models/product_model.dart';
import 'package:diletta_shop/features/products/domain/repositories/product_repository.dart';

class FetchProducts implements UseCase<List<ProductModel>, NoParams> {
  final ProductRepository _productRepository;

  FetchProducts({required ProductRepository productRepository})
      : _productRepository = productRepository;

  @override
  Future<Either<Failure, List<ProductModel>>> call(NoParams params) {
    return _productRepository.getProducts();
  }
}