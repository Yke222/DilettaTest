import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wishlist/features/product/data/models/rating_model.dart';
import 'package:wishlist/features/product/domain/enums/category_enum.dart';
import 'package:wishlist/features/wishlist/domain/entities/wish_product_entity.dart';

class WishProductModel extends WishProductEntity {
  WishProductModel({
    required super.userId,
    required super.id,
    required super.title,
    required super.price,
    required super.description,
    required super.image,
    required super.rating,
    required super.category,
  });

  factory WishProductModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return WishProductModel(
      userId: data?['userId'],
      id: int.parse(data?['id'].toString() ?? '0'),
      title: data?['title'],
      price: double.parse(data?['price'].toString() ?? '0'),
      description: data?['description'],
      image: data?['image'],
      rating: RatingModel.fromJson(data?['rating']),
      category: CategoryUtils.getCategoryEnumFromString(data?['category']),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'userId': userId.toString(),
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'image': image,
      'rating': RatingModel.fromEntity(rating).toJson(),
      'category': CategoryEnum.values.indexOf(category),
    };
  }

  WishProductModel copyWith({
    String? userId,
    int? id,
    String? title,
    double? price,
    String? description,
    String? image,
    RatingModel? rating,
    CategoryEnum? category,
  }) {
    return WishProductModel(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      description: description ?? this.description,
      image: image ?? this.image,
      rating: rating ?? this.rating,
      category: category ?? this.category,
    );
  }

  WishProductEntity toEntity() {
    return WishProductEntity(
      userId: userId,
      id: id,
      title: title,
      price: price,
      description: description,
      image: image,
      rating: rating,
      category: category,
    );
  }

  factory WishProductModel.fromEntity(WishProductEntity entity) {
    return WishProductModel(
      userId: entity.userId,
      id: entity.id,
      title: entity.title,
      price: entity.price,
      description: entity.description,
      category: entity.category,
      image: entity.image,
      rating: RatingModel.fromEntity(entity.rating),
    );
  }
}
