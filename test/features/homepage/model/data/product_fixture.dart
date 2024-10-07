import 'package:diletta_test/features/homepage/model/data/product.dart';
import 'package:diletta_test/features/homepage/model/data/rating.dart';

class ProductFixture {
  List<Product> build(int count) {
    return List<Product>.generate(count, (index) {
      return Product(
        id: index + 1,
        title: 'Mock Product Title ${index + 1}',
        price: 19.99 + index,
        description: 'This is mock product number ${index + 1} used for testing.',
        category: 'Mock Category ${(index % 3) + 1}',
        image: 'https://example.com/mock-image-${index + 1}.png',
        rating: Rating(
          rate: 3.0 + (index % 2),
          count: 50 + index * 10,
        ),
      );
    });
  }

  List<Map<String, dynamic>> buildJsonString(int count) {
    List<Map<String, dynamic>> jsonList = List<Map<String, dynamic>>.generate(count, (index) {
      return Product(
        id: index + 1,
        title: 'Mock Product Title ${index + 1}',
        price: 19.99 + index,
        description: 'This is mock product number ${index + 1} used for testing.',
        category: 'Mock Category ${(index % 3) + 1}',
        image: 'https://example.com/mock-image-${index + 1}.png',
        rating: Rating(
          rate: 3.0,
          count: 50,
        ),
      ).toJson();
    });

    return jsonList;
  }
}
