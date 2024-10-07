import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wishlist/config/extention/size.dart';
import 'package:wishlist/config/theme/app_colors.dart';
import 'package:wishlist/features/product/domain/entities/product_entity.dart';
import 'package:wishlist/features/product/domain/enums/category_enum.dart';

import '../../../wishlist/presentation/bloc/bloc.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({
    super.key,
    required this.product,
  });

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      margin: EdgeInsets.symmetric(horizontal: 16.0.r),
      decoration: BoxDecoration(
        color: AppColors.backgroundSecondary,
        borderRadius: BorderRadius.circular(16.0.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0.r),
            child: Image.network(
              product.image,
              width: 100.0.r,
              height: 100.0.r,
              fit: BoxFit.cover,
            ),
          ),
          16.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                8.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.0.r, vertical: 4.0.r),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8.0.r),
                      ),
                      child: Text(
                        CategoryUtils.getCategoryStringFromEnum(product.category),
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    BlocSelector<WishlistBloc, WishlistState, List<ProductEntity>>(
                      selector: (state) => state.products,
                      builder: (context, products) {
                        final itemsAdded = products.fold(
                          0,
                          (previousValue, element) =>
                              previousValue + (element.id == product.id ? 1 : 0),
                        );

                        if (itemsAdded == 0) {
                          return const SizedBox.shrink();
                        }

                        return Row(
                          children: [
                            Text(
                              "$itemsAdded",
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w300,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            4.horizontalSpace,
                            const Icon(
                              Icons.favorite_border_outlined,
                              color: AppColors.primary,
                              size: 16,
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
                8.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "\$${product.price.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            for (var i = 0; i < product.rating.rate.toInt(); i++)
                              const Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 16,
                              ),
                            for (var i = 0; i < 5 - product.rating.rate; i++)
                              const Icon(
                                Icons.star,
                                color: Colors.grey,
                                size: 16,
                              ),
                          ],
                        ),
                        Text(
                          "(${product.rating.count})",
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
