import 'package:flutter/material.dart';

class NavigationServices {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static get context => navigatorKey.currentState!.context;
}
