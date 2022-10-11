import 'package:flutter/cupertino.dart';

class RouteNavigator {
  static Future<void> pushName(BuildContext context, String route,
      {Object? arguments}) async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context).pushNamed(route, arguments: arguments);
    });
  }
}
