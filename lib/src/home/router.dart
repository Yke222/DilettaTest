import 'package:go_router/go_router.dart';
import 'pages/pages.dart';

extension FullPath on HomeRoutesEnum {
  String get fullPath => '${HomeRouter.basePath}/$routePath';
}

enum HomeRoutesEnum {
  home('home', 'home'),
  wishList('wish-list', 'wish-list');

  const HomeRoutesEnum(
    this.routePath,
    this.routeName,
  );

  final String routePath;
  final String routeName;
}

class HomeRouter {
  HomeRouter._();

  static const basePath = '/home';

  static List<RouteBase> routes = [
    GoRoute(
      path: HomeRoutesEnum.home.fullPath,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: HomeRoutesEnum.wishList.fullPath,
      builder: (context, state) => const WishListPage(),
    ),
  ];
}
