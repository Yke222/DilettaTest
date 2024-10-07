import 'package:store_app/domain/entities/get_item_details_rating.dart';

class GetItemDetailsRatingModel extends GetItemDetailsRatingEntities {
  const GetItemDetailsRatingModel({super.count, super.rate});

  GetItemDetailsRatingModel copyWith({num? count, num? rate}) {
    return GetItemDetailsRatingModel(
      count: count ?? this.count,
      rate: rate ?? this.rate,
    );
  }

  factory GetItemDetailsRatingModel.fromMap(Map<String, dynamic> map) {
    return GetItemDetailsRatingModel(
      rate: map["rate"],
      count: map["count"],
    );
  }
}
