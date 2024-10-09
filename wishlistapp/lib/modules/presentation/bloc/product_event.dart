part of 'product_bloc.dart';



abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class GetProductList extends ProductEvent {}

class AddToWishlist extends ProductEvent {
  final ProductModel product;

  const AddToWishlist(this.product);

  @override
  List<Object> get props => [product];
}

class RemoveFromWishlist extends ProductEvent {
  final ProductModel product;

  const RemoveFromWishlist(this.product);

  @override
  List<Object> get props => [product];
}
