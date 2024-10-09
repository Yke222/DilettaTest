import 'package:wishlistapp/modules/data/model/product_model.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> getProducts();
}
