import 'package:wishlistapp/modules/data/model/product_model.dart';
import 'package:wishlistapp/modules/domain/repositories/product_repository_impl.dart';

class GetProductsUsecase {
  final ProductRepositoryImpl repositoryImpl;

  GetProductsUsecase(this.repositoryImpl);

  Future<List<ProductModel>> callProducts() async {
    return await repositoryImpl.getProducts();
  }
}