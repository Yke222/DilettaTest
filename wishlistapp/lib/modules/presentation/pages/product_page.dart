import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/product_bloc.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products WishList'), centerTitle: true,),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductLoaded) {
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products[index];
                final isWishlisted = state.wishlist.contains(product);

                return ListTile(
                  title: Text(product.title),
                  subtitle: Text('\$${product.price}'),
                  leading: Image.network(product.image),
                  trailing: IconButton(
                    icon: Icon(
                      isWishlisted ? Icons.favorite : Icons.favorite_border,
                      color: isWishlisted ? Colors.red : null,
                    ),
                    onPressed: () {
                      if(isWishlisted) {
                        BlocProvider.of<ProductBloc>(context)
                          .add(RemoveFromWishlist(product));
                      } else {
                      BlocProvider.of<ProductBloc>(context)
                          .add(AddToWishlist(product));
                      }
                    },
                  ),
                );
              },
            );
          } else if (state is ProductError) {
            return Center(child: Text(state.message));
          }
          return Container();
        },
      ),
    );
  }
}
