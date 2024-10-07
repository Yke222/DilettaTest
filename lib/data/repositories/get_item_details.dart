import 'package:dartz/dartz.dart';
import 'package:store_app/data/datasource/get_item_details.dart';
import 'package:store_app/data/errors/error_exception.dart';
import 'package:store_app/data/models/get_item_details.dart';
import 'package:store_app/domain/repositories/get_item_details.dart';

class GetItemDetailsRepositoryImpl implements IGetItemDetailsRepository {
  final IItemDetailsDatasource _datasource;

  GetItemDetailsRepositoryImpl(this._datasource);

  @override
  Future<Either<ErrorException, List<GetItemDetailsModel>>> getItemDetails(String category) async {
    try {
      final response = await _datasource.getItemDetails(category);

      return Right(response);
    } catch (e) {
      return Left(ErrorException());
    }
  }
}
