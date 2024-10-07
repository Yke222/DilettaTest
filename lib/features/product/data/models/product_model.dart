import 'package:wishlist/features/product/data/models/rating_model.dart';
import 'package:wishlist/features/product/domain/entities/product_entity.dart';
import 'package:wishlist/features/product/domain/enums/category_enum.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required super.id,
    required super.title,
    required super.price,
    required super.description,
    required super.category,
    required super.image,
    required super.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: int.parse(json['id'].toString()),
      title: json['title'],
      price: double.parse(json['price'].toString()),
      description: json['description'],
      category: CategoryUtils.getCategoryEnumFromString(json['category']),
      image: json['image'],
      rating: RatingModel.fromJson(json['rating']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id.toString(),
      'title': title,
      'price': price.toString(),
      'description': description,
      'category': CategoryEnum.values.indexOf(category),
      'image': image,
      'rating': RatingModel.fromEntity(rating).toJson(),
    };
  }

  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      title: title,
      price: price,
      description: description,
      category: CategoryEnum.values[CategoryEnum.values.indexOf(category)],
      image: image,
      rating: RatingModel.fromEntity(rating).toEntity(),
    );
  }
}
