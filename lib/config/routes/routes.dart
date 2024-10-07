import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wishlist/features/auth/presentation/pages/login_page.dart';
import 'package:wishlist/features/auth/presentation/pages/not_fount_page.dart';
import 'package:wishlist/features/auth/presentation/pages/register_page.dart';
import 'package:wishlist/features/home/presentation/bloc/home_bloc.dart';
import 'package:wishlist/features/home/presentation/pages/home_page.dart';

class AuthChangeNotifier extends ChangeNotifier {
  AuthChangeNotifier() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      log('User: $user');
      notifyListeners();
    });
  }
}

final authChangeNotifier = AuthChangeNotifier();

final goRouterConfig = GoRouter(
  routerNeglect: true,
  overridePlatformDefaultLocation: true,
  routes: [
    GoRoute(
      path: LoginPage.routeName,
      builder: (context, state) {
        return const LoginPage();
      },
    ),
    GoRoute(
      path: RegisterPage.routeName,
      builder: (context, state) {
        return const RegisterPage();
      },
    ),
    GoRoute(
      path: HomePage.routeName,
      builder: (context, state) {
        context.read<HomeBloc>().add(InitialHomeEvent(context));
        return const HomePage();
      },
    ),
  ],
  refreshListenable: authChangeNotifier,
  observers: [
    CustomNavigatorObserver(),
  ],
  redirect: (BuildContext context, GoRouterState state) async {
    final isAuthenticated = FirebaseAuth.instance.currentUser != null;

    if (!isAuthenticated) {
      if (state.fullPath == LoginPage.routeName || state.fullPath == RegisterPage.routeName) {
        return null;
      } else {
        log('Redirect to LoginPage = ${state.fullPath}');
        return LoginPage.routeName;
      }
    } else {
      if (state.fullPath == LoginPage.routeName || state.fullPath == RegisterPage.routeName) {
        return HomePage.routeName;
      }
    }

    return null;
  },
  errorBuilder: (context, state) => const NotFoundPage(),
  initialLocation: HomePage.routeName,
);

class CustomNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    log('didPush: ${route.settings.name}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    log('didPop: ${route.settings.name}');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);
    log('didRemove: ${route.settings.name}');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    log('didReplace: ${newRoute!.settings.name}');
  }
}
