import 'package:diletta_shop/features/products/data/models/product_model.dart';
import 'package:diletta_shop/features/products/presentation/bloc/product_bloc.dart';
import 'package:diletta_shop/features/products/presentation/pages/wishlist_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(const FetchProductsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Diletta Shop'),
          actions: [
            IconButton(
              icon: const Icon(Icons.favorite_border_rounded),
              onPressed: () {
                context.read<ProductBloc>().add(const FetchWishlistEvent());

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const WishlistPage(),
                  ),
                );
              },
            ),
          ],
        ),
        body: _buildProductListPage());
  }

  Widget _buildProductListPage() {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProductLoadedState) {
          final products = state.products;
          return _buildListView(products);
        } else if (state is ProductWishlistLoadedState) {
          final products = state.products;
          return _buildListView(products);
        } else if (state is ProductWishlistErrorState) {
          final products = state.products;
          return _buildListView(products);
        } else if (state is ProductWishlistAddedState) {
          final products = state.products;
          return _buildListView(products);
        }
        else if (state is ProductErrorState) {
          return const Center(child: Text('Failed to load products'));
        } else {
          return const Center(child: Text('No products available'));
        }
      },
    );
  }

  Widget _buildListView(List<ProductModel> products) {
    return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return Card(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: ListTile(
                  leading: Image.network(
                    product.imageUrl,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(product.name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.description),
                      const SizedBox(height: 5),
                      Text('Price: R\$${product.price}'),
                    ],
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.favorite_border),
                    onPressed: () {
                      BlocProvider.of<ProductBloc>(context)
                          .add(AddToWishlistEvent(product: product));
                    },
                  ),
                ),
              );
            },
          );
  }
}
