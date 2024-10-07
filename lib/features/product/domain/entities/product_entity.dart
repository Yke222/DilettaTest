import 'package:wishlist/features/product/domain/entities/rating_entity.dart';
import 'package:wishlist/features/product/domain/enums/category_enum.dart';

class ProductEntity {
  int id;
  String title;
  double price;
  String description;
  CategoryEnum category;
  String image;
  RatingEntity rating;

  ProductEntity({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });
}