import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wishlist/features/product/domain/entities/product_entity.dart';
import 'package:wishlist/features/product/domain/usecases/fetch_products.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final FetchProductsUseCase _fetchProductsUseCase;

  ProductBloc(
    this._fetchProductsUseCase,
  ) : super(ProductState.initial()) {
    on<ProductEvent>((event, emit) {});
    on<FetchProductsEvent>(_fetchProducts);
  }

  Future<void> _fetchProducts(
    FetchProductsEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, hasError: false));
    if (state.products.isNotEmpty) {
      emit(state.copyWith(isLoading: false));
      return;
    }
    final result = await _fetchProductsUseCase.call();

    result.fold(
      (failure) {
        emit(state.copyWith(hasError: true));
      },
      (products) {
        emit(state.copyWith(products: products, isLoading: false));
      },
    );
    emit(state.copyWith(isLoading: false));
  }
}
