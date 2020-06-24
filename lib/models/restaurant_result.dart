import 'package:equatable/equatable.dart';
import 'package:food_now/models/restaurant_result_item.dart';

class RestaurantResult extends Equatable {
  const RestaurantResult({this.items});
  
  final List<RestaurantResultItem> items;

  @override
  List<Object> get props => [items];

  static RestaurantResult fromJson(dynamic json) {
    final items = (json['nearby_restaurants'] as List<dynamic>)
        .map((dynamic item) =>
            RestaurantResultItem.fromJson(item as Map<String, dynamic>))
        .toList();

    return RestaurantResult(items: items);
  }
}
