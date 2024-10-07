import 'package:dartz/dartz.dart';
import 'package:store_app/data/errors/error_exception.dart';
import 'package:store_app/domain/entities/get_item_details.dart';
import 'package:store_app/domain/repositories/get_item_details.dart';

abstract class IGetITemDetailsUseCase {
  Future<Either<ErrorException, List<GetItemDetailsEntities>>> call(String category);
}

class GetItemDetailsUseCaseImpl implements IGetITemDetailsUseCase {
  final IGetItemDetailsRepository _repository;

  GetItemDetailsUseCaseImpl(this._repository);

  @override
  Future<Either<ErrorException, List<GetItemDetailsEntities>>> call(String category) async {
    return await _repository.getItemDetails(category);
  }
}
