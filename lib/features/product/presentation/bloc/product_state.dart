part of 'product_bloc.dart';

class ProductState extends Equatable {
  final bool isLoading;
  final bool hasError;
  final List<ProductEntity> products;

  const ProductState({
    required this.isLoading,
    required this.hasError,
    required this.products,
  });

  ProductState copyWith({
    bool? isLoading,
    bool? hasError,
    List<ProductEntity>? products,
  }) {
    return ProductState(
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      products: products ?? this.products,
    );
  }

  factory ProductState.initial() {
    return const ProductState(
      isLoading: true,
      hasError: false,
      products: [],
    );
  }

  @override
  List<Object> get props => [
        isLoading,
        hasError,
        products,
      ];
}
