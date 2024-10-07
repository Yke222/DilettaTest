import 'package:dartz/dartz.dart';
import 'package:store_app/data/errors/error_exception.dart';
import 'package:store_app/domain/entities/get_all_category.dart';
import 'package:store_app/domain/repositories/get_all_category.dart';

abstract class IGetAllCategoryUseCase {
  Future<Either<ErrorException, List<GetAllCategoryEntities>>> call();
}

class GetAllCategoryUseCaseImpl implements IGetAllCategoryUseCase {
  final IGetAllCategoryRepository _repository;

  GetAllCategoryUseCaseImpl(this._repository);

  @override
  Future<Either<ErrorException, List<GetAllCategoryEntities>>> call() async {
    return await _repository.getAllCategory();
  }
}
