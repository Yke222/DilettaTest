import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
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
      ),
    );

    final (err, list) = await _repository.fetchListStarShips();

    if (err != null) {
      emit(
        state.copyWith(
          fetchListStarshipsStatus: const FetchDataStatus.error(),
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        fetchListStarshipsStatus: const FetchDataStatus.success(),
        listStarshipsStatus: list ?? [],
      ),
    );
  }
}
