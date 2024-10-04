import '../../../core/core.dart';
import '../home.dart';

abstract class IHomeRepository {
  Future<(Failure?, List<StarShipEntity>?)> fetchListStarShips();
  Failure? addToWishList(StarShipEntity starShipEntity);
  Failure? removeFromWishList(StarShipEntity starShipEntity);
  (Failure?, List<StarShipEntity>?) fetchWishList();
}

class HomeRepository implements IHomeRepository {
  const HomeRepository({
    required IHomeDatasource datasource,
    required ILocalDatasource localDatasource,
  })  : _datasource = datasource,
        _localDatasource = localDatasource;

  final IHomeDatasource _datasource;
  final ILocalDatasource _localDatasource;

  @override
  Future<(Failure?, List<StarShipEntity>?)> fetchListStarShips() async {
    try {
      final response = await _datasource.fetchStarChipsList();
      return (null, response);
    } on NotInternetException {
      return (
        NoInternetFailure(),
        null,
      );
    } catch (_) {
      return (
        ServerErrorFailure(
          message: 'ServerErrorFailure',
        ),
        null,
      );
    }
  }

  @override
  Failure? addToWishList(StarShipEntity starShipEntity) {
    try {
      final dto = StarShipResponseDTO.fromEntity(starShipEntity);

      _localDatasource.addToWishList(dto);
      return null;
    } catch (_) {
      return ServerErrorFailure(
        message: 'ServerErrorFailure',
      );
    }
  }

  @override
  (Failure?, List<StarShipEntity>?) fetchWishList() {
    try {
      return (null, _localDatasource.fetchWishList());
    } catch (_) {
      return (
        ServerErrorFailure(
          message: 'ServerErrorFailure',
        ),
        null
      );
    }
  }

  @override
  Failure? removeFromWishList(StarShipEntity starShipEntity) {
    try {
      final dto = StarShipResponseDTO.fromEntity(starShipEntity);

      _localDatasource.removeFronWishList(dto);
      return null;
    } catch (_) {
      return ServerErrorFailure(
        message: 'ServerErrorFailure',
      );
    }
  }
}
