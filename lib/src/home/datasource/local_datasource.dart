import '../home.dart';

abstract class ILocalDatasource {
  List<StarShipResponseDTO> fetchWishList();
  void addToWishList(StarShipResponseDTO dto);
  void removeFronWishList(StarShipResponseDTO dto);
}

class LocalDatasource implements ILocalDatasource {
  LocalDatasource();

  List<StarShipResponseDTO> wishlist = [];

  @override
  void addToWishList(StarShipResponseDTO dto) {
    wishlist.add(dto);
  }

  @override
  void removeFronWishList(StarShipResponseDTO dto) {
    wishlist.removeWhere(
      (element) => element.name == dto.name,
    );
  }

  @override
  List<StarShipResponseDTO> fetchWishList() {
    return wishlist;
  }
}
