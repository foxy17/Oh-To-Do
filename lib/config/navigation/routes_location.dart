import 'package:flutter/foundation.dart' show immutable;

@immutable
class RouteLocation {
  const RouteLocation._();
  //routeLocation
  static String get splash => '/splash';
  static String get homeScreen => '/homeScreen';
  static String get login => '/login';

}