import 'package:flutter/material.dart';
import 'package:food_now/models/restaurant_result_item.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:food_now/utils/utils.dart';

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
          flex: 4,
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
          child: buildMaterialText(
            text: item.resName,
            font: 'Roboto',
            size: 28.0,
            weight: FontWeight.w500,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: buildMaterialText(
              text: item.cuisines,
              font: 'Montserrat',
              size: 16,
              weight: RestaurantUtil.accentWeight,
              color: RestaurantUtil.accentColor,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: buildMaterialText(
              text: item.address,
              size: 15,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Center(
                  child: buildMaterialText(
                    text: '${item.ratingNum} 🌟\n"${item.ratingText}"',
                    font: 'Montserrat',
                    size: 16,
                    weight: RestaurantUtil.accentWeight,
                    color: RestaurantUtil.accentColor,
                    align: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: buildMaterialText(
                    text: 'Price range:\n${'💲' * item.priceRange}',
                    font: 'Montserrat',
                    size: 16,
                    weight: RestaurantUtil.accentWeight,
                    color: RestaurantUtil.accentColor,
                    align: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Note: Wrapped text in Material to prevent glitch in Hero animation.
  Material buildMaterialText({
    String text,
    String font,
    double size,
    FontWeight weight,
    Color color,
    TextAlign align,
  }) {
    return Material(
      color: Colors.transparent,
      child: Text(
        text,
        textAlign: align,
        style: GoogleFonts.getFont(
          font ?? 'Lato',
          textStyle: TextStyle(
            fontSize: size,
            fontWeight: weight,
            color: color,
          ),
        ),
      ),
    );
  }
}
