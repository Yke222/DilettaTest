import 'package:diletta_test/features/homepage/route/home_path.dart';
import 'package:diletta_test/features/wishlist/ui/wishlist_page.dart';
import 'package:flutter/material.dart';

import '../../../core/routes/base/feature_navigation.dart';
import '../../product/ui/product_details_page.dart';
import '../model/data/product.dart';

class HomeNavigation extends FeatureNavigation {
  @override
  Map<String, WidgetBuilder> get routes => {
        HomePath.wishlist.path: (context) => const WishlistPage(),
        HomePath.product.path: (context) => ProductDetailsPage(product: getArguments<Product>(context)!)
      };
}
