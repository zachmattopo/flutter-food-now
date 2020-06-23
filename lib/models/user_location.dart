import 'package:equatable/equatable.dart';

class UserLocation extends Equatable {
  final num lat;
  final num long;

  const UserLocation({
    this.lat,
    this.long,
  });

  @override
  List<Object> get props => [
        lat,
        long,
      ];
}
