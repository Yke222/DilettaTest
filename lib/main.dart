import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wishlist/config/dependencies/injection.dart';
import 'package:wishlist/config/routes/routes.dart';
import 'package:wishlist/config/theme/app_themes.dart';
import 'package:wishlist/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:wishlist/features/home/presentation/bloc/home_bloc.dart';
import 'package:wishlist/features/product/presentation/bloc/product_bloc.dart';
import 'package:wishlist/features/user/presentation/bloc/user_bloc.dart';
import 'package:wishlist/features/wishlist/presentation/bloc/wishlist_bloc.dart';
import 'package:wishlist/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  injectionDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          lazy: true,
          create: (context) => sl<AuthBloc>(),
        ),
        BlocProvider<HomeBloc>(
          lazy: true,
          create: (context) => sl<HomeBloc>(),
        ),
        BlocProvider<ProductBloc>(
          lazy: true,
          create: (context) => sl<ProductBloc>(),
        ),
        BlocProvider<UserBloc>(
          lazy: true,
          create: (context) => sl<UserBloc>(),
        ),
        BlocProvider<WishlistBloc>(
          lazy: true,
          create: (context) => sl<WishlistBloc>(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.dark,
        routerConfig: goRouterConfig,
      ),
    );
  }
}
