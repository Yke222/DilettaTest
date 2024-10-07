import 'package:equatable/equatable.dart';
import 'package:store_app/domain/entities/get_item_details_rating.dart';

class GetItemDetailsEntities extends Equatable {
  final int? id;
  final String? title;
  final num? price;
  final String? description;
  final String? category;
  final String? image;
  final GetItemDetailsRatingEntities? ratingEntities;
  const GetItemDetailsEntities({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.ratingEntities,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        price,
        description,
        category,
        image,
        ratingEntities,
      ];
}
