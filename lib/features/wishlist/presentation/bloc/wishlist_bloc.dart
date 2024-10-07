import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wishlist/features/product/domain/entities/product_entity.dart';
import 'package:wishlist/features/wishlist/domain/entities/wish_product_entity.dart';
import 'package:wishlist/features/wishlist/domain/usecases/add_product_wishlist.dart';
import 'package:wishlist/features/wishlist/domain/usecases/fetch_wishlist.dart';
import 'package:wishlist/features/wishlist/domain/usecases/remove_product_wishlist.dart';
import 'package:wishlist/utils/services/toast_widget.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  final FetchWishListUseCase fetchWishListUseCase;
  final AddProductWishListUseCase addProductWishListUseCase;
  final RemoveProductWishListUseCase removeProductWishListUseCase;

  WishlistBloc(
    this.fetchWishListUseCase,
    this.addProductWishListUseCase,
    this.removeProductWishListUseCase,
  ) : super(WishlistState.initial()) {
    on<WishlistEvent>((event, emit) {});
    on<FetchWishlistEvent>(_fetchWishlist);
    on<AddToWishlistEvent>(_addToWishlist);
    on<RemoveFromWishlistEvent>(_removeFromWishlist);
  }

  Future<void> _fetchWishlist(
    FetchWishlistEvent event,
    Emitter<WishlistState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, hasError: false));
    final result = await fetchWishListUseCase.call();
    result.fold(
      (failure) {
        emit(state.copyWith(hasError: true));
      },
      (products) {
        emit(state.copyWith(products: products));
      },
    );
    emit(state.copyWith(isLoading: false));
  }

  Future<void> _addToWishlist(
    AddToWishlistEvent event,
    Emitter<WishlistState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, hasError: false));
    final currentUser = FirebaseAuth.instance.currentUser;
    WishProductEntity product = WishProductEntity.createProduct(event.product, currentUser!.uid);
    final result = await addProductWishListUseCase.call(params: product);

    result.fold(
      (failure) {
        emit(state.copyWith(hasError: true));
      },
      (product) {
        List<WishProductEntity> updatedProducts = List.from(state.products)
          ..add(
            product,
          );
        emit(state.copyWith(products: updatedProducts));
      },
    );
    // ignore: use_build_context_synchronously
    ToastService(event.context).showToast(
      title: "Product added to wishlist",
      type: ToastType.success,
    );
    emit(state.copyWith(isLoading: false));
  }

  Future<void> _removeFromWishlist(
    RemoveFromWishlistEvent event,
    Emitter<WishlistState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, hasError: false));
    final result = await removeProductWishListUseCase.call(params: event.product.id);

    result.fold(
      (failure) {
        emit(state.copyWith(hasError: true));
      },
      (product) {
        List<WishProductEntity> updatedProducts = List.from(state.products)
          ..removeWhere(
            (element) => element.id == event.product.id,
          );
        emit(state.copyWith(products: updatedProducts));
      },
    );
    if (event.context.mounted) {
      ToastService(event.context).showToast(
        title: "Product removed from wishlist",
        type: ToastType.success,
      );
    }
    emit(state.copyWith(isLoading: false));
  }
}
