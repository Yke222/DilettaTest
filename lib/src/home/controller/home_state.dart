import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/core.dart';
import '../entity/starship_entity.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  HomeState._();

  factory HomeState({
    @Default(FetchDataStatus.idle()) FetchDataStatus fetchListStarshipsStatus,
    @Default([]) List<StarShipEntity> listStarships,
    @Default(FetchDataStatus.idle()) FetchDataStatus fetchWishlistStatus,
    @Default([]) List<StarShipEntity> wishlist,
    @Default(FetchDataStatus.idle()) FetchDataStatus updatehWishlistStatus,
    Failure? failure,
  }) = _HomeState;

  factory HomeState.initial() => HomeState();
}
