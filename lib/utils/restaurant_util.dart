import 'package:flutter/material.dart';

class RestaurantUtil {
  static Color accentColor = const Color(0xff365eff);
  static FontWeight accentWeight = FontWeight.w400;

  static Map<String, dynamic> devFlavorVars = {
    'title': 'Food Now Dev...',
    'baseUrl': 'https://developers.zomato.com',
  };

  static Map<String, dynamic> prodFlavorVars = {
    'title': 'Food Now...',
    'baseUrl': 'https://production.zomato.com', //example url only
  };
}