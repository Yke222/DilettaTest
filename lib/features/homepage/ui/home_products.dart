import 'package:diletta_test/core/helpers/double_helper.dart';
import 'package:diletta_test/features/homepage/extensions/home_extensions.dart';
import 'package:diletta_test/features/homepage/model/data/product.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_text.dart';

class HomeProducts extends StatelessWidget {
  const HomeProducts({super.key, required this.products, required this.onItemSelected});

  final List<Product> products;
  final Function(Product) onItemSelected;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10, childAspectRatio: 0.9),
      itemBuilder: (_, index) => product(products[index]),
    );
  }

  Widget product(Product item) {
    return GestureDetector(
      onTap: () => onItemSelected(item),
      child: Container(
        padding: EdgeInsets.all(8),
        color: Colors.white,
        child: Column(
          children: [
            Image.network(
              item.image,
              height: 100,
              fit: BoxFit.contain,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(
                description: item.title,
                fontSize: 14,
                maxLines: 2,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomText(
                  description: item.price.toMoneyFormatter(),
                  fontSize: 12,
                ),
                Row(
                  children: [
                    Row(
                      children: item.rating.rate.buildStarIcons(),
                    ),
                    const SizedBox(width: 4),
                    CustomText(
                      description: '${item.rating.rate}',
                      fontSize: 12,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
