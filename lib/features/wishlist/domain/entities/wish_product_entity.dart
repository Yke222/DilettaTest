import 'package:wishlist/features/product/domain/entities/product_entity.dart';

class WishProductEntity extends ProductEntity {
  final String userId;

  WishProductEntity({
    required this.userId,
    required super.id,
    required super.title,
    required super.price,
    required super.description,
    required super.category,
    required super.image,
    required super.rating,
  });

  factory WishProductEntity.createProduct(ProductEntity product, String userId) {
    return WishProductEntity(
      userId: userId,
      id: product.id,
      title: product.title,
      price: product.price,
      description: product.description,
      category: product.category,
      image: product.image,
      rating: product.rating,
    );
  }
}
