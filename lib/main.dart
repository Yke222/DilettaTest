import 'package:diletta_shop/core/di/service_locator.dart';
import 'package:diletta_shop/features/products/domain/usecases/fetch_products.dart';
import 'package:diletta_shop/features/products/domain/usecases/fetch_wishlist.dart';
import 'package:diletta_shop/features/products/domain/usecases/save_to_wishlist.dart';
import 'package:diletta_shop/features/products/presentation/bloc/product_bloc.dart';
import 'package:diletta_shop/features/products/presentation/pages/products_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductBloc(
          fetchProducts: getIt<FetchProducts>(),
          fetchWishlist: getIt<FetchWishlist>(),
          saveToWishlist: getIt<SaveToWishlist>()),
      child: MaterialApp(
        title: 'Diletta Shop',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ProductsPage(),
      ),
    );
  }
}
