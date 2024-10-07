import 'package:store_app/data/models/get_item_details_rating.dart';
import 'package:store_app/domain/entities/get_item_details.dart';

class GetItemDetailsModel extends GetItemDetailsEntities {
  const GetItemDetailsModel({
    super.id,
    super.title,
    super.price,
    super.description,
    super.category,
    super.image,
    super.ratingEntities,
  });
  GetItemDetailsModel copyWith({
    int? id,
    String? title,
    num? price,
    String? description,
    String? category,
    String? image,
    GetItemDetailsRatingModel? getItemDetailsRatingModel,
  }) {
    return GetItemDetailsModel(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      description: description ?? this.description,
      category: category ?? this.category,
      image: image ?? this.image,
      ratingEntities: getItemDetailsRatingModel ?? getItemDetailsRatingModel,
    );
  }

  static List<GetItemDetailsModel> itemDeatilsFromMap(Map<String, dynamic> map) {
    List<GetItemDetailsModel> items = [];

    if (map.isNotEmpty) {
      List<String> numericKeys = map.keys.where((key) => int.tryParse(key) != null).toList();

      for (var key in numericKeys) {
        var item = map[key];
        if (item is Map<String, dynamic>) {
          GetItemDetailsModel model = GetItemDetailsModel(
            id: item["id"],
            title: item["title"],
            price: item["price"],
            description: item["description"],
            category: item["category"],
            image: item["image"],
            ratingEntities: GetItemDetailsRatingModel.fromMap(item["rating"]),
          );
          items.add(model);
        }
      }
    }

    return items;
  }
}
