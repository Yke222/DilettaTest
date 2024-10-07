import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/domain/entities/get_all_category.dart';
import 'package:store_app/domain/usecases/get_all_category.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<GetAllCategoryEvent, AllCategoryState> {
  final IGetAllCategoryUseCase getAllCategoryUseCase;

  CategoryBloc(
    this.getAllCategoryUseCase,
  ) : super(const AllCategoryState(
          status: GetAllCategoryStatus.initial,
        )) {
    on<GetAllCategoryEvent>((event, emit) async {
      emit(state.copyWith(status: GetAllCategoryStatus.loading));

      var result = await getAllCategoryUseCase();
      result.fold((l) {
        emit(state.copyWith(status: GetAllCategoryStatus.failure, errorMessage: l.message));
      }, (r) {
        emit(state.copyWith(status: GetAllCategoryStatus.sucess, getAllCategoryEntities: r));
      });
    });
  }
}
