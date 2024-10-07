import 'package:flutter/material.dart';
import '../../features/homepage/ui/home_page.dart';
import 'base/feature_navigation.dart';
import 'path/app_route_path.dart';

class AppNavigation extends FeatureNavigation {
  @override
  Map<String, WidgetBuilder> get routes => {AppRoutePath.homePage.path: (_) => const HomePage()};
}
