import 'package:equatable/equatable.dart';
import 'package:food_now/models/general_location.dart';
import 'package:food_now/models/restaurant_result.dart';

class CombinedResult extends Equatable {
  const CombinedResult({
    this.generalLoc,
    this.restaurantList,
  });
  
  final GeneralLocation generalLoc;
  final RestaurantResult restaurantList;

  @override
  List<Object> get props => [
        generalLoc,
        restaurantList,
      ];
}
