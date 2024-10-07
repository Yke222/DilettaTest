import 'package:dartz/dartz.dart';
import 'package:store_app/data/errors/error_exception.dart';
import 'package:store_app/domain/entities/get_item_details.dart';

abstract class IGetItemDetailsRepository {
  Future<Either<ErrorException, List<GetItemDetailsEntities>>> getItemDetails(String category);
}
