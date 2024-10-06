import '../entity/starship_entity.dart';

class StarShipResponseDTO extends StarShipEntity {
  const StarShipResponseDTO({
    required super.name,
    required super.model,
    required super.costInCredits,
    required super.length,
    required super.maxAtmospheringSpeed,
    required super.passengers,
    required super.cargoCapacity,
    required super.starshipClass,
    super.onTheWishlist,
  });

  factory StarShipResponseDTO.fromJson(Map<String, dynamic> json) {
    return StarShipResponseDTO(
      name: json['name'] ?? '',
      model: json['model'] ?? '',
      costInCredits: json['cost_in_credits'] ?? '',
      length: json['length'] ?? '',
      maxAtmospheringSpeed: json['max_atmosphering_speed'] ?? '',
      passengers: json['passengers'] ?? '',
      cargoCapacity: json['cargo_capacity'] ?? '',
      starshipClass: json['starship_class'] ?? '',
    );
  }

  factory StarShipResponseDTO.fromWishListJson(Map<String, dynamic> json) {
    return StarShipResponseDTO(
      name: json['name'] ?? '',
      model: json['model'] ?? '',
      costInCredits: json['cost_in_credits'] ?? '',
      length: json['length'] ?? '',
      maxAtmospheringSpeed: json['max_atmosphering_speed'] ?? '',
      passengers: json['passengers'] ?? '',
      cargoCapacity: json['cargo_capacity'] ?? '',
      starshipClass: json['starship_class'] ?? '',
      onTheWishlist: true,
    );
  }

  factory StarShipResponseDTO.fromEntity(StarShipEntity entity) {
    return StarShipResponseDTO(
      name: entity.name,
      model: entity.model,
      costInCredits: entity.costInCredits,
      length: entity.length,
      maxAtmospheringSpeed: entity.maxAtmospheringSpeed,
      passengers: entity.passengers,
      cargoCapacity: entity.cargoCapacity,
      starshipClass: entity.starshipClass,
    );
  }
}
