part of 'wishlist_bloc.dart';

class WishlistState extends Equatable {
  final List<WishProductEntity> products;
  final bool hasError;
  final bool isLoading;

  const WishlistState({
    required this.products,
    required this.hasError,
    required this.isLoading,
  });

  WishlistState copyWith({
    List<WishProductEntity>? products,
    bool? hasError,
    bool? isLoading,
  }) =>
      WishlistState(
        products: products ?? this.products,
        hasError: hasError ?? this.hasError,
        isLoading: isLoading ?? this.isLoading,
      );

  factory WishlistState.initial() => const WishlistState(
        products: [],
        hasError: false,
        isLoading: false,
      );

  @override
  List<Object> get props => [
        products,
        hasError,
        isLoading,
      ];
}
