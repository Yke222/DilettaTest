import 'package:flutter/material.dart';
import 'package:wishlist/config/theme/app_colors.dart';
import 'package:wishlist/features/product/domain/entities/product_entity.dart';
import 'package:wishlist/features/product/presentation/pages/product_item_page.dart';

class ProductBottomSheet {
  static Future<void> showProduct({
    required BuildContext context,
    required ProductEntity product,
  }) async {
    return await showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      isScrollControlled: true,
      backgroundColor: AppColors.backgroundSecondary,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.9,
          padding: const EdgeInsets.only(top: 16.0),
          decoration: const BoxDecoration(
            color: AppColors.backgroundSecondary,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32.0),
              topRight: Radius.circular(32.0),
            ),
          ),
          child: ProductItemPage(product: product),
        );
      },
    );
  }
}
