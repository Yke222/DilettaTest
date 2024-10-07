import 'package:diletta_test/core/extensions/context_extensions.dart';
import 'package:diletta_test/core/helpers/double_helper.dart';
import 'package:diletta_test/features/homepage/extensions/home_extensions.dart';
import 'package:flutter/material.dart';
import '../../../core/di/setup_locator.dart';
import '../../../widgets/custom_text.dart';
import '../../homepage/model/data/product.dart';
import '../vm/product_details_vm.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key, required this.product});

  final Product product;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  final _vm = getIt.get<ProductDetailsViewModel>();

  @override
  void initState() {
    super.initState();
    _vm.checkIfItemIsOnWishList(widget.product);
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
      body: SingleChildScrollView(child: _body),
    );
  }

  Widget get _body => Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                widget.product.image,
                height: 200,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 12),
            CustomText(
              description: widget.product.title,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  description: widget.product.price.toMoneyFormatter(),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                Row(
                  children: [
                    Row(
                      children: widget.product.rating.rate.buildStarIcons(iconSize: 20),
                    ),
                    const SizedBox(width: 10),
                    CustomText(
                      description: '${widget.product.rating.rate}',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            CustomText(
              description: widget.product.description,
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
            _button
          ],
        ),
      );

  Widget get _button => ValueListenableBuilder<bool>(
        valueListenable: _vm.productAdded,
        builder: (_, isAdded, __) {
          return isAdded
              ? Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: Center(
                    child: CustomText(
                      description: context.appStrings.product_already_in_wishlist,
                      color: Colors.red,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    onPressed: () => _vm.addItemOnWishlist(widget.product).then((_) {
                      if (!context.mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.green[600],
                          content: CustomText(description:  context.appStrings.product_added_to_wishlist),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    }),
                    child: Text(
                      context.appStrings.add_product_to_wishlist,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
        },
      );
}
