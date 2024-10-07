import 'package:equatable/equatable.dart';

class GetAllCategoryEntities extends Equatable {
  final String? nameCategory;

  const GetAllCategoryEntities({
    this.nameCategory,
  });

  @override
  List<Object?> get props => [
        nameCategory,
      ];
}
