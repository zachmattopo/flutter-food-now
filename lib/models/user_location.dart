import 'package:equatable/equatable.dart';

class UserLocation extends Equatable {
  const UserLocation({
    this.lat,
    this.long,
  });
  
  final num lat;
  final num long;

  @override
  List<Object> get props => [
        lat,
        long,
      ];
}
