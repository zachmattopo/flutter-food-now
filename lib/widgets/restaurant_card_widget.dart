import 'package:flutter/material.dart';
import 'package:food_now/models/restaurant_result_item.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:food_now/utils/utils.dart';
import 'package:auto_size_text/auto_size_text.dart';

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
          child: Align(
            alignment: Alignment.center,
            child: buildMaterialText(
              text: item.resName,
              font: 'Roboto',
              size: 28.0,
              weight: FontWeight.w500,
              maxLines: 2,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.center,
            child: buildMaterialText(
              text: item.cuisines,
              font: 'Montserrat',
              size: 21,
              weight: RestaurantUtil.accentWeight,
              color: RestaurantUtil.accentColor,
              maxLines: 1,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: buildMaterialText(
              text: item.address,
              size: 23,
              maxLines: 3,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: buildMaterialText(
                      text: '${item.ratingNum} 🌟\n"${item.ratingText}"',
                      font: 'Montserrat',
                      size: 18,
                      weight: RestaurantUtil.accentWeight,
                      color: RestaurantUtil.accentColor,
                      align: TextAlign.center,
                      maxLines: 2,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: buildMaterialText(
                      text: 'Price:\n${'💲' * item.priceRange}',
                      font: 'Montserrat',
                      size: 18,
                      weight: RestaurantUtil.accentWeight,
                      color: RestaurantUtil.accentColor,
                      align: TextAlign.center,
                      maxLines: 2,
                    ),
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
    int maxLines,
  }) {
    return Material(
      color: Colors.transparent,
      child: AutoSizeText(
        text,
        textAlign: align,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
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
