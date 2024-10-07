import 'package:hive/hive.dart';
import '../../../homepage/model/data/product.dart';

part 'wishlist_item.g.dart';

@HiveType(typeId: 1)
class WishlistItem extends HiveObject {
  @HiveField(0)
  final int productId;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final double price;

  @HiveField(3)
  final String description;

  @HiveField(4)
  final String category;

  @HiveField(5)
  final String image;

  @HiveField(6)
  final double ratingRate;

  @HiveField(7)
  final int ratingCount;

  @HiveField(8)
  final DateTime dateAdded;

  WishlistItem({
    required this.productId,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.ratingRate,
    required this.ratingCount,
    required this.dateAdded,
  });

  factory WishlistItem.fromProduct(Product product) {
    return WishlistItem(
      productId: product.id,
      title: product.title,
      price: product.price,
      description: product.description,
      category: product.category,
      image: product.image,
      ratingRate: product.rating.rate,
      ratingCount: product.rating.count,
      dateAdded: DateTime.now(),
    );
  }
}
