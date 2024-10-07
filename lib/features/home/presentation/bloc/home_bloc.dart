import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wishlist/features/product/presentation/bloc/product_bloc.dart';
import 'package:wishlist/features/wishlist/presentation/bloc/wishlist_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.initial()) {
    on<HomeEvent>((event, emit) {});
    on<InitialHomeEvent>(_initial);
    on<OnPageChangeHomeEvent>(_onPageChange);
  }

  void _initial(InitialHomeEvent event, Emitter<HomeState> emit) {
    event.context.read<ProductBloc>().add(FetchProductsEvent());
    event.context.read<WishlistBloc>().add(const FetchWishlistEvent());
  }

  void _onPageChange(OnPageChangeHomeEvent event, Emitter<HomeState> emit) {
    log('pageIndexBLOC: ${event.pageIndex}');
    emit(state.copyWith(pageIndex: event.pageIndex));
  }
}
