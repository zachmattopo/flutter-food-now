import 'package:flutter/material.dart';
import 'package:food_now/models/restaurant_result_item.dart';
import 'package:google_fonts/google_fonts.dart';

class RestaurantCardWidget extends StatelessWidget {
  const RestaurantCardWidget({
    Key key,
    @required this.item,
  }) : super(key: key);

  final RestaurantResultItem item;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 3,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24.0),
            child: FadeInImage.assetNetwork(
              placeholder: 'assets/images/default-food-pic.jpg',
              image: item.headerImage,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            item.resName,
            style: GoogleFonts.getFont(
              'Roboto',
              textStyle: TextStyle(
                  fontSize: 28, fontWeight: FontWeight.w500),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              item.cuisines,
              style: GoogleFonts.getFont(
                'Montserrat',
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff365eff),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              item.address,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
        ),
      ],
    );
  }
}