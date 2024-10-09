import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wishlistapp/modules/data/model/product_model.dart';
import 'package:wishlistapp/modules/domain/usecases/get_products_usecase.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductsUsecase getProducts;

  ProductBloc({required this.getProducts}) : super(ProductInitial()) {
    on<GetProductList>(_onGetProductList);
    on<AddToWishlist>(_onAddToWishlist);
    on<RemoveFromWishlist>(_onRemoveFromWishlist);
  }

  Future<void> _onGetProductList(GetProductList event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    try {
      final products = await getProducts.callProducts();
      emit(ProductLoaded(products: products));
    } catch (e) {
      emit(ProductError(message: e.toString()));
    }
  }

  void _onAddToWishlist(AddToWishlist event, Emitter<ProductState> emit) {
    final currentState = state;
    if (currentState is ProductLoaded) {
      emit(ProductLoaded(
        products: currentState.products,
        wishlist: [...currentState.wishlist, event.product],
      ));
    }
  }

  void _onRemoveFromWishlist(RemoveFromWishlist event, Emitter<ProductState> emit) {
    final currentState = state;
    if (currentState is ProductLoaded) {
      final updatedWishlist = currentState.wishlist
          .where((product) => product.id != event.product.id)
          .toList();
      emit(ProductLoaded(
        products: currentState.products,
        wishlist: updatedWishlist,
      ));
    }
  }
}
