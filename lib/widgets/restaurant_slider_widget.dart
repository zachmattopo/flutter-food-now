import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food_now/models/models.dart';
import 'package:food_now/widgets/widgets.dart';
import 'package:food_now/utils/utils.dart';

class RestaurantSliderWidget extends StatelessWidget {
  const RestaurantSliderWidget({
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
                    padding: EdgeInsets.fromLTRB(25.0, 0.0, 25.5, 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(100.0),
                        topRight: Radius.circular(26.0),
                        bottomRight: Radius.circular(100.0),
                        bottomLeft: Radius.circular(26.0),
                      ),
                      color: RestaurantUtil.accentColor,
                    ),
                    child: // Adobe XD layer: 'View All' (text)
                        Text(
                      '${genLoc.place}, ${genLoc.city}',
                      style: TextStyle(
                        fontFamily: 'Montserrat-SemiBold',
                        fontSize: 18,
                        color: Colors.white,
                        height: 1.7777777777777777,
                      ),
                      textAlign: TextAlign.left,
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
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return RestaurantDetailWidget(item: itemsList[index]);
                  }));
                },
                child: Hero(
                  tag: itemsList[index].resId,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          spreadRadius: 1.5,
                          blurRadius: 1.5,
                          offset: Offset(1, 1),
                        ),
                      ],
                    ),
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    child: RestaurantCardWidget(item: itemsList[index]),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
