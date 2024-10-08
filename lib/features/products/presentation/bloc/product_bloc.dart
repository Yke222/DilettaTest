import 'package:diletta_shop/core/usecases/usecase.dart';
import 'package:diletta_shop/features/products/data/models/product_model.dart';
import 'package:diletta_shop/features/products/domain/usecases/fetch_products.dart';
import 'package:diletta_shop/features/products/domain/usecases/fetch_wishlist.dart';
import 'package:diletta_shop/features/products/domain/usecases/save_to_wishlist.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final FetchProducts _fetchProducts;
  final FetchWishlist _fetchWishlist;
  final SaveToWishlist _saveToWishlist;
  List<ProductModel> _products = [];

  ProductBloc(
      {required FetchProducts fetchProducts,
      required FetchWishlist fetchWishlist,
      required SaveToWishlist saveToWishlist})
      : _fetchProducts = fetchProducts,
        _fetchWishlist = fetchWishlist,
        _saveToWishlist = saveToWishlist,
        super(const ProductInitialState()) {
          on<FetchProductsEvent>(_onFetchProductsEvent);
          on<FetchWishlistEvent>(_onFetchWishlistEvent);
          on<AddToWishlistEvent>(_onAddToWishlistEvent);
        }
  
  Future<void> _onFetchProductsEvent(FetchProductsEvent event, Emitter<ProductState> emit) async {
    emit(const ProductLoadingState());
    final result = await _fetchProducts(NoParams());

    result.fold((left) {
      emit(ProductErrorState(message: left.toString()));
    }, (right) {
      _products = right;
      emit(ProductLoadedState(products: right));
    });
  }

  Future<void> _onFetchWishlistEvent(FetchWishlistEvent event, Emitter<ProductState> emit) async {
    emit(const ProductWishlistLoadingState());
    final result = await _fetchWishlist(NoParams());

    result.fold((left) {
      emit(ProductWishlistErrorState(message: left.toString(), products: _products));
    }, (right) {
      emit(ProductWishlistLoadedState(products: right));
    });
  }

  Future<void> _onAddToWishlistEvent(AddToWishlistEvent event, Emitter<ProductState> emit) async {
    emit(const ProductWishlistLoadingState());
    final result = await _saveToWishlist(event.product);

    result.fold((left) {
      emit(ProductWishlistErrorState(message: left.toString(), products: _products));
    }, (right) {
      emit(ProductWishlistAddedState(products: _products));
    });
  }
}
