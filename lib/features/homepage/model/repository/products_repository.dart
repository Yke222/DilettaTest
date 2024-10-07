import '../../../../core/impl/dio/dio_get_client.dart';

class ProductsRepository {
  ProductsRepository({required this.getClient});

  final DioGetClient getClient;

  static const String productsPath = '/products';
  static const String categoriesPath = '/products/categories';
  static const String filterPath = '/products/category';

  Future<dynamic> fetchProducts() async {
    final result = await getClient.get(url: productsPath);
    return result;
  }

  Future<dynamic> fetchCategories() async {
    final result = await getClient.get(url: categoriesPath);
    return result;
  }
}
