import 'package:diletta_test/features/wishlist/model/data/wishlist_item.dart';

class WishlistItemFixture {
  List<WishlistItem> build(int count) {
    return List<WishlistItem>.generate(count, (index) {
      return WishlistItem(
        productId: index + 1,
        title: 'Mock Product Title ${index + 1}',
        price: 19.99 + index,
        description: 'This is mock product number ${index + 1} used for testing.',
        category: 'Mock Category ${(index % 3) + 1}',
        image: 'https://example.com/mock-image-${index + 1}.png',
        ratingRate: 4,
        ratingCount: 55,
        dateAdded: DateTime.now(),
      );
    });
  }
}
