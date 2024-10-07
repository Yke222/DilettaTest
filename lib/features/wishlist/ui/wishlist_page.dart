import 'package:diletta_test/core/extensions/context_extensions.dart';
import 'package:diletta_test/features/homepage/model/data/product.dart';
import 'package:diletta_test/features/wishlist/route/wishlist_path.dart';
import 'package:diletta_test/features/wishlist/viewmodel/wishlist_vm.dart';
import 'package:diletta_test/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../../../core/di/setup_locator.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  final _vm = getIt.get<WishlistViewModel>();

  @override
  void initState() {
    super.initState();
    _vm.getProductsOnWishlist();
  }

  @override
  void dispose() {
    _vm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: _body,
    );
  }

  Widget get _body => Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              description: context.appStrings.your_wishlist,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            _items,
            SizedBox(height: 16),
            Align(
              alignment: Alignment.bottomCenter,
              child: _clearButton,
            ),
          ],
        ),
      );

  Widget get _items => ValueListenableBuilder<List<Product>>(
        valueListenable: _vm.productsOnWishlist,
        builder: (_, products, __) {
          return products.isEmpty
              ? Expanded(
                  child: Align(
                      alignment: Alignment.center,
                      child: CustomText(
                        description: context.appStrings.wishlist_is_empty,
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      )),
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return GestureDetector(
                        onTap: () => openProductDetails(product),
                        child: Card(
                          color: Colors.white,
                          child: ListTile(
                            leading: Image.network(
                              product.image,
                              width: 50,
                              height: 50,
                              fit: BoxFit.contain,
                            ),
                            title: CustomText(description: product.title, maxLines: 2),
                            subtitle: CustomText(description: '\$${product.price.toStringAsFixed(2)}'),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () => _vm.removeProduct(index),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
        },
      );

  Widget get _clearButton => Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pinkAccent, Colors.redAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            textStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () => _vm.clearWishlist(),
          child: CustomText(description: context.appStrings.clear_wishlist),
        ),
      );

  void openProductDetails(Product product) {
    Navigator.of(context).pushNamed(WishlistPath.product.path, arguments: product);
  }
}
