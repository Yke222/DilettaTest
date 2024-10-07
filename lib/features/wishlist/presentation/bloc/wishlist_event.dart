part of 'wishlist_bloc.dart';

abstract class WishlistEvent extends Equatable {
  const WishlistEvent();

  @override
  List<Object> get props => [];
}

class FetchWishlistEvent extends WishlistEvent {
  const FetchWishlistEvent();
}

class AddToWishlistEvent extends WishlistEvent {
  final ProductEntity product;
  final BuildContext context;

  const AddToWishlistEvent(this.product, this.context);

  @override
  List<Object> get props => [product, context];
}

class RemoveFromWishlistEvent extends WishlistEvent {
  final ProductEntity product;
  final BuildContext context;

  const RemoveFromWishlistEvent(this.product, this.context);

  @override
  List<Object> get props => [product, context];
}
