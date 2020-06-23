import 'package:equatable/equatable.dart';
import 'package:food_now/models/general_location.dart';
import 'package:food_now/models/restaurant_result.dart';

class CombinedResult extends Equatable {
  final GeneralLocation generalLoc;
  final RestaurantResult restaurantList;

  const CombinedResult({
    this.generalLoc,
    this.restaurantList,
  });

  @override
  List<Object> get props => [
        generalLoc,
        restaurantList,
      ];
}
