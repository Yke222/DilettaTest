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

  const StarShipEntity({
    required this.name,
    required this.model,
    required this.costInCredits,
    required this.length,
    required this.maxAtmospheringSpeed,
    required this.passengers,
    required this.cargoCapacity,
    required this.starshipClass,
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
}
