import 'package:equatable/equatable.dart';

class GeneralLocation extends Equatable {
  final String place;
  final String city;
  final String country;

  const GeneralLocation({
    this.place,
    this.city,
    this.country,
  });

  @override
  List<Object> get props => [
        place,
        city,
        country,
      ];

  static GeneralLocation fromJson(dynamic json) {
    final location = json['location'];

    return GeneralLocation(
      place: location['title'],
      city: location['city_name'],
      country: location['country_name'],
    );
  }
}
