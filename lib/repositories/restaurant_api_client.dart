import 'dart:convert';

import 'package:food_now/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class RestaurantApiClient {
  RestaurantApiClient({
    @required this.httpClient,
  }) : assert(httpClient != null);
  
  static const String baseUrl = 'https://developers.zomato.com';
  final String _apiKey = '1e3c349cc25d35cea4a89cf86995cd6b';
  final http.Client httpClient;

  Future<CombinedResult> fetchGeocode(num lat, num long) async {
    final double latDouble = lat.toDouble();
    final double longDouble = long.toDouble();
    final String url =
        '$baseUrl/api/v2.1/geocode?lat=$latDouble&lon=$longDouble';
    final Map<String, String> header = {'user-key': _apiKey};
    final http.Response urlResponse =
        await httpClient.get(url, headers: header);

    if (urlResponse.statusCode != 200) {
      throw Exception('Error getting restaurants for location!');
    }

    final dynamic restaurantJson = jsonDecode(urlResponse.body);
    final GeneralLocation generalLoc = GeneralLocation.fromJson(restaurantJson);
    final RestaurantResult restaurantResult =
        RestaurantResult.fromJson(restaurantJson);

    return CombinedResult(
      generalLoc: generalLoc,
      restaurantList: restaurantResult,
    );
  }
}
