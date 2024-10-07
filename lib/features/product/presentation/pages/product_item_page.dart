import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wishlist/config/extention/size.dart';
import 'package:wishlist/features/product/domain/entities/product_entity.dart';
import 'package:wishlist/features/wishlist/presentation/bloc/bloc.dart';
import 'package:wishlist/utils/widget/button/primary_button_widget.dart';

class ProductItemPage extends StatelessWidget {
  const ProductItemPage({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          8.verticalSpace,
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0.r),
            child: Image.network(
              product.image,
              width: 300.0.r,
              height: 300.0.r,
              fit: BoxFit.cover,
            ),
          ),
          8.verticalSpace,
          Text(
            product.title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
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
                          size: 20,
                        ),
                      for (var i = 0; i < 5 - product.rating.rate; i++)
                        const Icon(
                          Icons.star,
                          color: Colors.grey,
                          size: 20,
                        ),
                    ],
                  ),
                  Text(
                    "(${product.rating.count})",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ],
          ),
          16.verticalSpace,
          Text(
            product.description,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w300,
            ),
            maxLines: 6,
            overflow: TextOverflow.ellipsis,
          ),
          32.verticalSpace,
          BlocSelector<WishlistBloc, WishlistState, Tuple2<List<ProductEntity>, bool>>(
            selector: (state) => Tuple2(state.products, state.isLoading),
            builder: (context, tuple2) {
              final wishListProducts = tuple2.value1;
              final isLoading = tuple2.value2;
              if (wishListProducts.contains(product)) {
                return SizedBox(
                  height: 50.0.h,
                  width: MediaQuery.of(context).size.width - 16,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {
                          context.read<WishlistBloc>().add(AddToWishlistEvent(product, context));
                        },
                        icon: const Icon(
                          Icons.add,
                          size: 30,
                          color: Colors.green,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          (wishListProducts.fold(
                            0,
                            (previousValue, element) =>
                                previousValue + (element.id == product.id ? 1 : 0),
                          )).toStringAsFixed(0),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          context
                              .read<WishlistBloc>()
                              .add(RemoveFromWishlistEvent(product, context));
                        },
                        icon: const Icon(
                          Icons.remove,
                          size: 30,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                );
              }
              return PrimaryButtonWidget(
                name: "Add to wishlist",
                loading: isLoading,
                onPressed: () {
                  context.read<WishlistBloc>().add(AddToWishlistEvent(product, context));
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
