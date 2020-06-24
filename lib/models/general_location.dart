import 'package:equatable/equatable.dart';

class GeneralLocation extends Equatable {
const GeneralLocation({
    this.place,
    this.city,
    this.country,
  });

  final String place;
  final String city;
  final String country;

  @override
  List<Object> get props => [
        place,
        city,
        country,
      ];

  static GeneralLocation fromJson(dynamic json) {
    final location = json['location'];

    return GeneralLocation(
      place: location['title'] as String,
      city: location['city_name'] as String,
      country: location['country_name'] as String,
    );
  }
}
