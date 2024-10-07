part of 'category_bloc.dart';

enum GetAllCategoryStatus { initial, sucess, failure, loading }

class AllCategoryState extends Equatable {
  final GetAllCategoryStatus status;
  final List<GetAllCategoryEntities>? getAllCategoryEntities;
  final String? errorMessage;

  const AllCategoryState({required this.status, this.errorMessage, this.getAllCategoryEntities});
  @override
  List get props => [status, getAllCategoryEntities];

  AllCategoryState copyWith({
    GetAllCategoryStatus? status,
    List<GetAllCategoryEntities>? getAllCategoryEntities,
    String? errorMessage,
  }) {
    return AllCategoryState(
      status: status ?? this.status,
      getAllCategoryEntities: getAllCategoryEntities ?? this.getAllCategoryEntities,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
