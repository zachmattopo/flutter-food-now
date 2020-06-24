import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_now/bloc/restaurant_bloc.dart';
import 'package:food_now/repositories/repositories.dart';
import 'package:food_now/widgets/widgets.dart';
import 'package:http/http.dart' as http;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // BlocSupervisor.delegate = MainBlocDelegate();

  final RestaurantRepository restaurantRepository = RestaurantRepository(
    restaurantApiClient: RestaurantApiClient(
      httpClient: http.Client(),
    ),
  );

  runApp(FoodNowApp(restaurantRepository: restaurantRepository));
}

class FoodNowApp extends StatelessWidget {
  const FoodNowApp({Key key, @required this.restaurantRepository})
      : assert(restaurantRepository != null),
        super(key: key);

  final RestaurantRepository restaurantRepository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Now',
      home: BlocProvider(
        create: (context) =>
            RestaurantBloc(restaurantRepository: restaurantRepository),
        child: HomeWidget(),
      ),
    );
  }
}
