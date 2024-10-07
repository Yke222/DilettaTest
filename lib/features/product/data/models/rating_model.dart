import 'package:wishlist/features/product/domain/entities/rating_entity.dart';

class RatingModel extends RatingEntity {
  RatingModel({
    required super.rate,
    required super.count,
  });

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(
      rate: double.parse(json['rate'].toString()),
      count: int.parse(json['count'].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rate': rate.toString(),
      'count': count.toString(),
    };
  }

  factory RatingModel.fromEntity(RatingEntity entity) {
    return RatingModel(
      rate: entity.rate,
      count: entity.count,
    );
  }

  RatingEntity toEntity() {
    return RatingEntity(
      rate: rate,
      count: count,
    );
  }
}
