import 'dart:io';

import 'package:diletta_test/features/homepage/route/home_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../features/wishlist/route/wishlist_navigation.dart';
import '../../main.dart';
import '../routes/app_navigation.dart';

extension AppExtension on MyApp {
  Map<String, WidgetBuilder> get appRoutes => AppNavigation().routes
    ..addAll(HomeNavigation().routes)
    ..addAll(WishlistNavigation().routes);
}

void runCatching(Function exec, {Function? onError}) {
  try {
    exec();
  } catch (e) {
    onError?.call(e);
  }
}

void closeApp() {
  if (Platform.isIOS) {
    exit(0);
  } else {
    SystemNavigator.pop();
  }
}
