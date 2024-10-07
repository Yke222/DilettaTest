part of 'item_details_bloc.dart';

enum GetItemDetailsStatus { initial, sucess, failure, loading }

class ItemDetailsState extends Equatable {
  final GetItemDetailsStatus status;
  final List<GetItemDetailsEntities>? getItemDetailsEntities;
  final String? errorMessage;
  final String? valueCategory;
  final List<String> favoriteItems; // Nova propriedade para armazenar os favoritos

  const ItemDetailsState({
    required this.status,
    this.errorMessage,
    this.getItemDetailsEntities,
    this.valueCategory,
    this.favoriteItems = const [],
  });

  @override
  List<Object?> get props => [status, getItemDetailsEntities, valueCategory, favoriteItems];

  ItemDetailsState copyWith({
    String? valueCategory,
    GetItemDetailsStatus? status,
    List<GetItemDetailsEntities>? getItemDetailsEntities,
    String? errorMessage,
    List<String>? favoriteItems,
  }) {
    return ItemDetailsState(
      status: status ?? this.status,
      getItemDetailsEntities: getItemDetailsEntities ?? this.getItemDetailsEntities,
      errorMessage: errorMessage ?? this.errorMessage,
      valueCategory: valueCategory ?? this.valueCategory,
      favoriteItems: favoriteItems ?? this.favoriteItems,
    );
  }
}
