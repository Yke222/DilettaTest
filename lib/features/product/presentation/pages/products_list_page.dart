import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:wishlist/config/extention/size.dart';
import 'package:wishlist/config/theme/app_colors.dart';
import 'package:wishlist/features/product/domain/entities/product_entity.dart';
import 'package:wishlist/features/product/presentation/bloc/product_bloc.dart';
import 'package:wishlist/features/product/presentation/modal/product_bottom_sheet.dart';
import 'package:wishlist/features/product/presentation/widgets/product_item_widget.dart';
import 'package:wishlist/utils/services/toast_widget.dart';

class ProductsListPage extends StatelessWidget {
  const ProductsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductBloc, ProductState>(
      listener: (context, state) {
        if (state.hasError) {
          ToastService(context).showToast(
            title: "Error fetching products",
            type: ToastType.error,
          );
        }
      },
      builder: (context, state) {
        return ListView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            16.verticalSpace,
            Padding(
              padding: EdgeInsets.only(left: 16.0.r),
              child: const Text(
                "Products",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            32.verticalSpace,
            BlocSelector<ProductBloc, ProductState, dartz.Tuple2<List<ProductEntity>, bool>>(
              selector: (state) => dartz.Tuple2(state.products, state.isLoading),
              builder: (context, tuple2) {
                final products = tuple2.value1;
                final isLoading = tuple2.value2;
                if (isLoading) {
                  return Center(
                    child: LoadingAnimationWidget.discreteCircle(
                      size: 40,
                      color: AppColors.textPrimary,
                    ),
                  );
                }
                return ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => 10.verticalSpace,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return GestureDetector(
                      onTap: () async {
                        await ProductBottomSheet.showProduct(
                          context: context,
                          product: product,
                        );
                      },
                      child: ProductItemWidget(product: product),
                    );
                  },
                );
              },
            )
          ],
        );
      },
    );
  }
}
