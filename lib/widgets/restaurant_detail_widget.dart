import 'package:flutter/material.dart';
import 'package:food_now/models/restaurant_result_item.dart';
import 'package:food_now/widgets/widgets.dart';

class RestaurantDetailWidget extends StatelessWidget {
  const RestaurantDetailWidget({
    Key key,
    @required this.item,
  }) : super(key: key);

  final RestaurantResultItem item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Hero(
          tag: item.resId,
          child: RestaurantCardWidget(item: item),
        ),
      ),
    );
  }
}
