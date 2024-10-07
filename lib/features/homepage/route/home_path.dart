import '../../../core/routes/base/base_route_path.dart';

enum HomePath implements BaseRoutePath {
  wishlist('home/wishlist'),
  product('home/product');

  const HomePath(this.path);

  @override
  final String path;
}