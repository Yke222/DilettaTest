import '../../../core/core.dart';
import '../datasource/datasource.dart';
import '../entity/starship_entity.dart';

abstract class IHomeRepository {
  Future<(Exception?, List<StarShipEntity>?)> fetchListStarShips();
}

class HomeRepository implements IHomeRepository {
  const HomeRepository({
    required IHomeDatasource datasource,
  }) : _datasource = datasource;

  final IHomeDatasource _datasource;

  @override
  Future<(Exception?, List<StarShipEntity>?)> fetchListStarShips() async {
    try {
      final response = await _datasource.fetchStarChipsList();
      return (null, response);
    } catch (_) {
      return (
        ServerErrorFailure(
          message: 'ServerErrorFailure',
        ),
        null,
      );
    }
  }
}
