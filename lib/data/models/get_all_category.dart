import 'package:store_app/domain/entities/get_all_category.dart';

class GetAllCategoryModel extends GetAllCategoryEntities {
  const GetAllCategoryModel({
    required super.nameCategory,
  });

  GetAllCategoryModel copyWith({
    String? nameCategory,
  }) {
    return GetAllCategoryModel(nameCategory: nameCategory ?? this.nameCategory);
  }

  factory GetAllCategoryModel.fromJson(String json) {
    return GetAllCategoryModel(nameCategory: json);
  }

  static List<GetAllCategoryModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => GetAllCategoryModel.fromJson(json)).toList();
  }
}
