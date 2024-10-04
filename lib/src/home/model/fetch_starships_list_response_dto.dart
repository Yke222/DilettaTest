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
    required this.manufacturer,
    required this.crew,
    required this.consumables,
    required this.hyperdriveRating,
    required this.mglt,
    required this.created,
    required this.edited,
    required this.url,
  });
  
  final String manufacturer;
  final String crew;
  final String consumables;
  final String hyperdriveRating;
  final String mglt;
  final String created;
  final String edited;
  final String url;

  factory StarShipResponseDTO.fromJson(Map<String, dynamic> json) {
    return StarShipResponseDTO(
      name: json['name'] ?? '',
      model: json['model'] ?? '',
      manufacturer: json['manufacturer'] ?? '',
      costInCredits: json['cost_in_credits'] ?? '',
      length: json['length'] ?? '',
      maxAtmospheringSpeed: json['max_atmosphering_speed'] ?? '',
      crew: json['crew'] ?? '',
      passengers: json['passengers'] ?? '',
      cargoCapacity: json['cargo_capacity'] ?? '',
      consumables: json['consumables'] ?? '',
      hyperdriveRating: json['hyperdrive_rating'] ?? '',
      mglt: json['MGLT'] ?? '',
      starshipClass: json['starship_class'] ?? '',
      created: json['created'] ?? '',
      edited: json['edited'] ?? '',
      url: json['url'] ?? '',
    );
  }
}
