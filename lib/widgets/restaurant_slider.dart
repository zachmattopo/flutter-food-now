import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:food_now/models/models.dart';
import 'package:google_fonts/google_fonts.dart';

class RestaurantSlider extends StatelessWidget {
  const RestaurantSlider({
    Key key,
    @required this.genLoc,
    @required this.itemsList,
  }) : super(key: key);

  final GeneralLocation genLoc;
  final List<RestaurantResultItem> itemsList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  'in',
                  style: TextStyle(
                    fontFamily: 'Montserrat-SemiBold',
                    fontSize: 15,
                  ),
                ),
              ),
              // Adobe XD layer: 'Btn view all' (group)
              Stack(
                children: <Widget>[
                  // Adobe XD layer: 'Rectangle' (shape)
                  Container(
                    child: // Adobe XD layer: 'View All' (text)
                        Text(
                      '${genLoc.place}, ${genLoc.city}',
                      style: TextStyle(
                        fontFamily: 'Montserrat-SemiBold',
                        fontSize: 18,
                        color: Color(0xffffffff),
                        height: 1.7777777777777777,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    // width: 239.0,
                    // height: 48.0,
                    padding: EdgeInsets.fromLTRB(25.0, 0.0, 25.5, 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(100.0),
                        topRight: Radius.circular(26.0),
                        bottomRight: Radius.circular(100.0),
                        bottomLeft: Radius.circular(26.0),
                      ),
                      color: const Color(0xff365eff),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: CarouselSlider.builder(
            options: CarouselOptions(
              aspectRatio: 0.63,
              enableInfiniteScroll: false,
              enlargeCenterPage: true,
              viewportFraction: 0.65,
            ),
            itemCount: itemsList.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      spreadRadius: 1.5,
                      blurRadius: 1.0,
                      offset: Offset(1, 1),
                    ),
                  ],
                ),
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24.0),
                        child: FadeInImage.assetNetwork(
                          placeholder:
                              'assets/images/default-food-pic.jpg',
                          image: itemsList[index].thumbnail,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        itemsList[index].resName,
                        style: GoogleFonts.getFont(
                          'Roboto',
                          textStyle: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          itemsList[index].cuisines,
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
                          itemsList[index].address,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}