import '../../../core/routes/base/base_route_path.dart';

enum WishlistPath implements BaseRoutePath {
  product('wishlist/product');

  const WishlistPath(this.path);

  @override
  final String path;
}
