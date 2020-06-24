import 'package:equatable/equatable.dart';

class RestaurantResultItem extends Equatable {
  const RestaurantResultItem({
    this.resName,
    this.resId,
    this.thumbnail,
    this.headerImage,
    this.address,
    this.cuisines,
    this.priceRange,
    this.ratingNum,
    this.ratingText,
  });
  
  final String resName;
  final int resId;
  final String thumbnail;
  final String headerImage;
  final String address;
  final String cuisines;
  final int priceRange;
  final String ratingNum;
  final String ratingText;

  @override
  List<Object> get props => [
        resName,
        resId,
        thumbnail,
        headerImage,
        address,
        cuisines,
        priceRange,
        ratingNum,
        ratingText,
      ];

  static RestaurantResultItem fromJson(dynamic json) {
    final restaurant = json['restaurant'];

    return RestaurantResultItem(
      resName: restaurant['name'] as String,
      resId: restaurant['R']['res_id'] as int,
      thumbnail: restaurant['thumb'] as String,
      headerImage: restaurant['featured_image'] as String,
      address: restaurant['location']['address'] as String,
      cuisines: restaurant['cuisines'] as String,
      priceRange: restaurant['price_range'] as int,
      ratingNum:
          restaurant['user_rating']['rating_obj']['title']['text'] as String,
      ratingText: restaurant['user_rating']['rating_text'] as String,
    );
  }
}
