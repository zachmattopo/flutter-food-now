import 'package:food_now/models/user_location.dart';
import 'package:location/location.dart';

class LocationService {
  static UserLocation _currentLocation;

  static Location location = Location();

  static Future<UserLocation> getUserLocation() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    try {
      final userLocation = await location.getLocation();
      _currentLocation = UserLocation(
        lat: userLocation.latitude,
        long: userLocation.longitude,
      );
    } on Exception {
      // print('Could not get location: ${e.toString()}');
      return null;
    }

    return _currentLocation;
  }
}
