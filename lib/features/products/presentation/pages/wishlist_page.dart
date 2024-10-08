import 'package:diletta_shop/features/products/presentation/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wishlist'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.read<ProductBloc>().add(const FetchProductsEvent());
            Navigator.pop(context);
          },
        ),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductWishlistLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductWishlistLoadedState) {
            final wishlist = state.products;

            if (wishlist.isEmpty) {
              return const Center(
                child: Text(
                  'No items in wishlist',
                  style: TextStyle(fontSize: 18),
                ),
              );
            }

            return ListView.builder(
              itemCount: wishlist.length,
              itemBuilder: (context, index) {
                final product = wishlist[index];
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
                      icon: const Icon(Icons.remove_circle_outline),
                      onPressed: () {
                        BlocProvider.of<ProductBloc>(context).add(
                          AddToWishlistEvent(product: product),
                        );
                      },
                    ),
                  ),
                );
              },
            );
          } else if (state is ProductWishlistErrorState) {
            return const Center(child: Text('Failed to load wishlist'));
          } else if (state is ProductWishlistAddedState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Item added or removed from wishlist'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      context
                          .read<ProductBloc>()
                          .add(const FetchWishlistEvent());
                    },
                    child: const Text('Update Wishlist'),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: Text('No items in wishlist'));
          }
        },
      ),
    );
  }
}
