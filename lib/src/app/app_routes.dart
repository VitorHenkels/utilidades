import 'package:flutter/material.dart';

Map<String, WidgetBuilder> generateRoutes() {
  final Map<String, WidgetBuilder> routes = {};
  for (var item in appMenuItems) {
    routes[item.route]=
    (context) => BaseLayout();
  }

  return routes;
}
