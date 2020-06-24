import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_now/bloc/restaurant_bloc.dart';
import 'package:food_now/widgets/restaurant_slider_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<RestaurantBloc>(context).add(RestaurantsRequested());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            top: 10,
          ),
          child: Text(
            'Food Now...',
            style: GoogleFonts.getFont(
              'Roboto',
              textStyle: TextStyle(
                color: Colors.black,
                fontSize: 24,
              ),
            ),
          ),
        ),
      ),
      body: BlocBuilder<RestaurantBloc, RestaurantState>(
        builder: (context, state) {
          if (state is RestaurantInitial) {
            return Center(
                child: Text('App is loading.\nThat, or it might be broken.'));
          }

          if (state is RestaurantLoadInProgress) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is RestaurantLoadSuccess) {
            final itemsList = state.combinedResult.restaurantList.items;
            final genLoc = state.combinedResult.generalLoc;

            return RestaurantSliderWidget(genLoc: genLoc, itemsList: itemsList);
          }

          if (state is RestaurantLoadFailure) {
            return Center(
              child: Text(
                '''
                Something went wrong!
                \nPlease allow location access and
                \nensure your GPS is working properly.
                ''',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20.0,
                ),
              ),
            );
          }

          return Center();
        },
      ),
    );
  }
}
