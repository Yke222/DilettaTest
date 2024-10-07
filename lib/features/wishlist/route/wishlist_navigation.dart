import 'package:diletta_test/features/product/ui/product_details_page.dart';
import 'package:diletta_test/features/wishlist/route/wishlist_path.dart';
import 'package:flutter/material.dart';

import '../../../core/routes/base/feature_navigation.dart';
import '../../homepage/model/data/product.dart';

class WishlistNavigation extends FeatureNavigation {
  @override
  Map<String, WidgetBuilder> get routes => {
    WishlistPath.product.path: (context) => ProductDetailsPage(product: getArguments<Product>(context)!)
  };
}