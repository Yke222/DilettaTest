import 'package:dartz/dartz.dart';
import 'package:store_app/data/datasource/get_all_category.dart';
import 'package:store_app/data/errors/error_exception.dart';
import 'package:store_app/data/models/get_all_category.dart';
import 'package:store_app/domain/repositories/get_all_category.dart';

class GetAllCategoryRepositoryImpl implements IGetAllCategoryRepository {
  final IGetAllCategoryDatasource _datasource;

  GetAllCategoryRepositoryImpl(this._datasource);

  @override
  Future<Either<ErrorException, List<GetAllCategoryModel>>> getAllCategory() async {
    try {
      final response = await _datasource.getAllCategory();

      return Right(response);
    } catch (e) {
      return Left(ErrorException());
    }
  }
}
