import 'package:equatable/equatable.dart';

class StarShipEntity extends Equatable {
  final String name;
  final String model;
  final String costInCredits;
  final String length;
  final String maxAtmospheringSpeed;
  final String passengers;
  final String cargoCapacity;
  final String starshipClass;
  final bool onTheWishlist;

  const StarShipEntity({
    required this.name,
    required this.model,
    required this.costInCredits,
    required this.length,
    required this.maxAtmospheringSpeed,
    required this.passengers,
    required this.cargoCapacity,
    required this.starshipClass,
    this.onTheWishlist = false,
  });

  @override
  List<Object?> get props => [
        name,
        model,
        costInCredits,
        length,
        maxAtmospheringSpeed,
        passengers,
        cargoCapacity,
        starshipClass,
      ];

  StarShipEntity copyWith({
    String? name,
    String? model,
    String? costInCredits,
    String? length,
    String? maxAtmospheringSpeed,
    String? passengers,
    String? cargoCapacity,
    String? starshipClass,
    bool? onTheWishlist,
  }) {
    return StarShipEntity(
      name: name ?? this.name,
      model: model ?? this.model,
      costInCredits: costInCredits ?? this.costInCredits,
      length: length ?? this.length,
      maxAtmospheringSpeed: maxAtmospheringSpeed ?? this.maxAtmospheringSpeed,
      passengers: passengers ?? this.passengers,
      cargoCapacity: cargoCapacity ?? this.cargoCapacity,
      starshipClass: starshipClass ?? this.starshipClass,
      onTheWishlist: onTheWishlist ?? this.onTheWishlist,
    );
  }
}
