import '../../../core/core.dart';
import '../home.dart';

abstract class IHomeDatasource {
  Future<List<StarShipResponseDTO>> fetchStarChipsList();
}

class HomeDatasource implements IHomeDatasource {
  HomeDatasource({
    required HttpClient httpClient,
  }) : _httpClient = httpClient;

  final HttpClient _httpClient;

  @override
  Future<List<StarShipResponseDTO>> fetchStarChipsList() async {
    final result = await _httpClient.doRequest(
      HttpRequest(
        method: RequestTypeEnum.get.name,
        path: HomeDataSourceRoutes.starChips,
      ),
    );

    return ((result.data as Map)['results'] as List<dynamic>)
        .map(
          (e) => StarShipResponseDTO.fromJson(e),
        )
        .toList();
  }
}
