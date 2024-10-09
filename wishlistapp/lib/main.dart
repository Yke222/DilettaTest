import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wishlistapp/modules/domain/repositories/product_repository_impl.dart';
import 'package:wishlistapp/modules/domain/usecases/get_products_usecase.dart';
import 'package:wishlistapp/modules/presentation/bloc/product_bloc.dart';
import 'package:wishlistapp/modules/presentation/pages/product_page.dart';
void main() {
  final productRepositoryImpl = ProductRepositoryImpl();
  runApp(MyApp(productRepositoryImpl: productRepositoryImpl));
}

class MyApp extends StatelessWidget {
  final ProductRepositoryImpl productRepositoryImpl;

  const MyApp({super.key, required this.productRepositoryImpl});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => ProductBloc(getProducts: GetProductsUsecase(productRepositoryImpl))
          ..add(GetProductList()),
        child: const ProductPage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}