part of 'restaurant_bloc.dart';

abstract class RestaurantState extends Equatable {
  const RestaurantState();

  @override
  List<Object> get props => [];
}

class RestaurantInitial extends RestaurantState {}

class RestaurantLoadInProgress extends RestaurantState {}

class RestaurantLoadSuccess extends RestaurantState {
  const RestaurantLoadSuccess({@required this.combinedResult})
      : assert(combinedResult != null);
      
  final CombinedResult combinedResult;

  @override
  List<Object> get props => [combinedResult];
}

class RestaurantLoadFailure extends RestaurantState {}
