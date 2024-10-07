part of 'item_details_bloc.dart';

abstract class ItemDetailsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ItemDetailsEv extends ItemDetailsEvent {
  final String? category;

  ItemDetailsEv({this.category});
}

class ValueCategory extends ItemDetailsEv {
  final String valueCategory;

  ValueCategory({
    required this.valueCategory,
  });
}

class ToggleFavoriteEvent extends ItemDetailsEv {
  final String itemId;

  ToggleFavoriteEvent({
    required this.itemId,
  });
}

class LoadFavoritesEvent extends ItemDetailsEv {}
