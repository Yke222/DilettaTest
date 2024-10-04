import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'home/home.dart';


final rootNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: HomeRoutesEnum.home.fullPath,
  navigatorKey: rootNavigatorKey,
  routes: [
    ...HomeRouter.routes,
  ],
);
