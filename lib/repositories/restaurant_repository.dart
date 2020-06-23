import 'dart:async';

import 'package:meta/meta.dart';

import 'package:food_now/repositories/restaurant_api_client.dart';
import 'package:food_now/repositories/location_service.dart';
import 'package:food_now/models/models.dart';

class RestaurantRepository {
  final RestaurantApiClient restaurantApiClient;

  RestaurantRepository({@required this.restaurantApiClient})
      : assert(restaurantApiClient != null);

  Future<CombinedResult> getRestaurants() async {
    final UserLocation userLoc = await LocationService.getUserLocation();

    if (userLoc == null) return null;

    return restaurantApiClient.fetchGeocode(userLoc.lat, userLoc.long);
  }
}