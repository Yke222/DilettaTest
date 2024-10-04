import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../entity/starship_entity.dart';
import '../repository/repository.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required IHomeRepository repository,
  })  : _repository = repository,
        super(HomeState.initial());

  final IHomeRepository _repository;

  Future<void> fetchListStarships() async {
    emit(
      state.copyWith(
        fetchListStarshipsStatus: const FetchDataStatus.loading(),
        failure: null,
      ),
    );

    final (err, list) = await _repository.fetchListStarShips();

    if (err != null) {
      emit(
        state.copyWith(
          fetchListStarshipsStatus: const FetchDataStatus.error(),
          failure: err,
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        fetchListStarshipsStatus: const FetchDataStatus.success(),
        listStarships: list ?? [],
      ),
    );
  }

  void fetchWishlist() {
    emit(
      state.copyWith(
        fetchWishlistStatus: const FetchDataStatus.loading(),
        updatehWishlistStatus: const FetchDataStatus.idle(),
        failure: null,
      ),
    );

    final (err, list) = _repository.fetchWishList();

    if (err != null) {
      emit(
        state.copyWith(
          fetchWishlistStatus: const FetchDataStatus.error(),
          failure: err,
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        fetchWishlistStatus: const FetchDataStatus.success(),
        wishlist: list ?? [],
      ),
    );
  }

  void addToWishlist(StarShipEntity starChipEntity) {
    emit(
      state.copyWith(
        updatehWishlistStatus: const FetchDataStatus.loading(),
        failure: null,
      ),
    );

    final err = _repository.addToWishList(starChipEntity);

    if (err != null) {
      emit(
        state.copyWith(
          updatehWishlistStatus: const FetchDataStatus.error(),
          failure: err,
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        updatehWishlistStatus: const FetchDataStatus.success(),
      ),
    );
  }

  void removeFromWishlist(StarShipEntity starChipEntity) {
    emit(
      state.copyWith(
        updatehWishlistStatus: const FetchDataStatus.loading(),
        failure: null,
      ),
    );

    final err = _repository.removeFromWishList(starChipEntity);

    if (err != null) {
      emit(
        state.copyWith(
          updatehWishlistStatus: const FetchDataStatus.error(),
          failure: err,
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        updatehWishlistStatus: const FetchDataStatus.success(),
      ),
    );
  }

  void updateCurrentList() {
    emit(
      state.copyWith(
        fetchListStarshipsStatus: const FetchDataStatus.loading(),
      ),
    );

    final newList = List<StarShipEntity>.from(state.listStarships).toList();
    final wishlist = state.wishlist.map(
      (e) => e.name,
    ).toList();

    final updatedList = newList
        .map(
          (e) => wishlist.contains(e.name)
              ? e.copyWith(onTheWishlist: true)
              : e.copyWith(onTheWishlist: false),
        )
        .toList();

    emit(
      state.copyWith(
        listStarships: updatedList,
        fetchListStarshipsStatus: const FetchDataStatus.success(),
      ),
    );
  }
}
