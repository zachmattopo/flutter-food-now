import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_now/models/models.dart';
import 'package:food_now/repositories/repositories.dart';
import 'package:meta/meta.dart';

part 'restaurant_event.dart';
part 'restaurant_state.dart';

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  RestaurantBloc({@required this.restaurantRepository})
      : assert(restaurantRepository != null);
      
  final RestaurantRepository restaurantRepository;

  @override
  RestaurantState get initialState => RestaurantInitial();

  @override
  Stream<RestaurantState> mapEventToState(
    RestaurantEvent event,
  ) async* {
    if (event is RestaurantsRequested) {
      yield RestaurantLoadInProgress();

      try {
        final CombinedResult combinedResult =
            await restaurantRepository.getRestaurants();

        if (combinedResult == null) {
          yield RestaurantLoadFailure();
        } else {
          yield RestaurantLoadSuccess(combinedResult: combinedResult);
        }
      } catch (_) {
        yield RestaurantLoadFailure();
      }
    }
  }
}
