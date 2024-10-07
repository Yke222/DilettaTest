import 'package:dartz/dartz.dart';
import 'package:store_app/data/errors/error_exception.dart';
import 'package:store_app/domain/entities/get_all_category.dart';

abstract class IGetAllCategoryRepository {
  Future<Either<ErrorException, List<GetAllCategoryEntities>>> getAllCategory();
}
