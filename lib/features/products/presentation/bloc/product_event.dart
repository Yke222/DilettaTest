part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object?> get props => [];

}

final class FetchProductsEvent extends ProductEvent {
  const FetchProductsEvent();
}

final class FetchWishlistEvent extends ProductEvent {
  const FetchWishlistEvent();
}

final class AddToWishlistEvent extends ProductEvent {
  final ProductModel product;

  const AddToWishlistEvent({required this.product});

  @override
  List<Object?> get props => [product];
}

final class RemoveFromWishlistEvent extends ProductEvent {
  final ProductModel product;

  const RemoveFromWishlistEvent({required this.product});

  @override
  List<Object?> get props => [product];
}