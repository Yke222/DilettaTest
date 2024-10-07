import 'package:equatable/equatable.dart';

class GetItemDetailsRatingEntities extends Equatable {
  final num? rate;
  final num? count;

  const GetItemDetailsRatingEntities({this.rate, this.count});

  @override
  List<Object?> get props => [rate, count];
}
