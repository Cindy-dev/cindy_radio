import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class ScopedNavigatorChild {
  final String routeName;
  final Widget routeWidget;
  ScopedNavigatorChild({required this.routeName, required this.routeWidget});
}

/// Widget frame for scoping navigation
///
/// To use Named routes, specify each route in [routes]
/// Navigator.of(context) will access the nearest navigator in the widget tree.
///
/// To target specific navigators, use the navigator keys
/// ```dart
/// customNavigationKey.currentState?.push()
/// ```
class ScopedNavigator extends StatelessWidget {
  /// Key used to access this [Navigator] instance
  final GlobalKey<NavigatorState> navigatorKey;

  /// Specifies the name and widget of the initial route
  final ScopedNavigatorChild defaultRoute;

  /// Specify routes to be used with named routing
  final List<ScopedNavigatorChild> routes;

  const ScopedNavigator({
    Key? key,
    required this.navigatorKey,
    required this.defaultRoute,
    this.routes = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: defaultRoute.routeName,
      onGenerateRoute: (routeSettings) {
        final newRouteName = routeSettings.name;
        ScopedNavigatorChild? screen = routes.firstWhereOrNull(
              (route) => route.routeName == newRouteName,
        );
        if (screen == null) {
          if (newRouteName == defaultRoute.routeName) {
            screen = defaultRoute;
          } else {
            throw "The route $newRouteName does not exist in the nearest navigator routes. "
                "Please specify routeName in the nearest navigator or specify the navigator you want to navigate with using its key. "
                "If your nearest navigator uses ScopedNavigator widget, add an entry in the route list argument, "
                "containing the route name $newRouteName";
          }
        }
        return MaterialPageRoute(
          builder: (context) => screen!.routeWidget,
        );
      },
    );
  }
}