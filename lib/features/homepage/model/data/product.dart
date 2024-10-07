import 'package:diletta_test/features/homepage/model/data/rating.dart';
import '../../../wishlist/model/data/wishlist_item.dart';

class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final Rating rating;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String,
      category: json['category'] as String,
      image: json['image'] as String,
      rating: Rating.fromJson(json['rating'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
      'rating': rating.toJson(),
    };
  }

  factory Product.toProduct(WishlistItem item) {
    return Product(
      id: item.productId,
      title: item.title,
      price: item.price,
      description: item.description,
      category: item.category,
      image: item.image,
      rating: Rating(
        rate: item.ratingRate,
        count: item.ratingCount,
      ),
    );
  }
}
