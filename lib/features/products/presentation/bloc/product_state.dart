part of "product_bloc.dart";

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object?> get props => [];
}

final class ProductInitialState extends ProductState {
  const ProductInitialState();
}

final class ProductLoadingState extends ProductState {
  const ProductLoadingState();
}

final class ProductLoadedState extends ProductState {
  final List<ProductModel> products;

  const ProductLoadedState({required this.products});

  @override
  List<Object?> get props => [products];
}

final class ProductErrorState extends ProductState {
  final String message;

  const ProductErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}

final class ProductWishlistState extends ProductState {

  const ProductWishlistState();

  @override
  List<Object?> get props => [];
}

final class ProductWishlistLoadingState extends ProductState {
  const ProductWishlistLoadingState();
}

final class ProductWishlistLoadedState extends ProductState {
  final List<ProductModel> products;

  const ProductWishlistLoadedState({required this.products});

  @override
  List<Object?> get props => [products];
}

final class ProductWishlistAddedState extends ProductState {
  final List<ProductModel> products;

  const ProductWishlistAddedState({required this.products});

  @override
  List<Object?> get props => [products];
}

final class ProductWishlistRemovedState extends ProductState {
  final List<ProductModel> products;

  const ProductWishlistRemovedState({required this.products});

  @override
  List<Object?> get props => [products];
}

final class ProductWishlistErrorState extends ProductState {
  final List<ProductModel> products;
  final String message;

  const ProductWishlistErrorState({required this.message, required this.products});

  @override
  List<Object?> get props => [message, products];
}