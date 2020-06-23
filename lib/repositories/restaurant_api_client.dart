import 'dart:convert';

import 'package:food_now/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class RestaurantApiClient {
  static const baseUrl = 'https://developers.zomato.com';
  final _apiKey = '1e3c349cc25d35cea4a89cf86995cd6b';
  final http.Client httpClient;

  RestaurantApiClient({
    @required this.httpClient,
  }) : assert(httpClient != null);

  Future<CombinedResult> fetchGeocode(num lat, num long) async {
    double latDouble = lat.toDouble();
    double longDouble = long.toDouble();
    final url = '$baseUrl/api/v2.1/geocode?lat=$latDouble&lon=$longDouble';
    final header = {'user-key': _apiKey};
    final urlResponse = await this.httpClient.get(url, headers: header);

    if (urlResponse.statusCode != 200) {
      throw Exception('Error getting restaurants for location!');
    }

    final restaurantJson = jsonDecode(urlResponse.body);
    final generalLoc = GeneralLocation.fromJson(restaurantJson);
    final restaurantResult = RestaurantResult.fromJson(restaurantJson);

    return CombinedResult(
      generalLoc: generalLoc,
      restaurantList: restaurantResult,
    );
  }
}
