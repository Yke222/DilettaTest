import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/domain/entities/get_item_details.dart';
import 'package:store_app/domain/usecases/get_item_details.dart';

part 'item_details_event.dart';
part 'item_details_state.dart';

class ItemDetailsBloc extends Bloc<ItemDetailsEv, ItemDetailsState> {
  final IGetITemDetailsUseCase getItemDetails;
  final SharedPreferences sharedPreferences;
  ItemDetailsBloc(
    this.getItemDetails,
    this.sharedPreferences,
  ) : super(const ItemDetailsState(
          status: GetItemDetailsStatus.initial,
        )) {
    on<ItemDetailsEv>((event, emit) async {
      emit(state.copyWith(status: GetItemDetailsStatus.loading));

      var result = await getItemDetails(event.category ?? "");
      result.fold((l) {
        // emit(state.copyWith(status: GetItemDetailsStatus.failure, errorMessage: l.message));
      }, (r) {
        emit(state.copyWith(status: GetItemDetailsStatus.sucess, getItemDetailsEntities: r));
      });
    });
    on<ValueCategory>((event, emit) {
      emit(state.copyWith(valueCategory: event.valueCategory, status: GetItemDetailsStatus.sucess));
    });
    on<ToggleFavoriteEvent>((event, emit) async {
      List<String> favorites = List.from(state.favoriteItems);

      if (favorites.contains(event.itemId)) {
        favorites.remove(event.itemId);
      } else {
        favorites.add(
          event.itemId,
        );
      }
      await sharedPreferences.setStringList('favorites', favorites);
      emit(state.copyWith(favoriteItems: favorites, status: GetItemDetailsStatus.sucess));
    });
    on<LoadFavoritesEvent>((event, emit) async {
      final favorites = sharedPreferences.getStringList('favorites') ?? [];
      emit(state.copyWith(favoriteItems: favorites, status: GetItemDetailsStatus.sucess));
    });
  }
}
