import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wishlistapp/modules/data/model/product_model.dart';
import 'package:wishlistapp/modules/data/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  @override
  Future<List<ProductModel>> getProducts() async {
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));

    if (response.statusCode == 200) {
      List<dynamic> json = jsonDecode(response.body);
      return json.map((e) => ProductModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}