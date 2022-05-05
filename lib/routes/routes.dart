import 'package:flutter/material.dart';

import '../ui/screens/home_screen/home_screen.dart';
import '../ui/screens/login_screen/login_screen.dart';
import '../ui/screens/splash_screen/splash_screen.dart';

import 'route_constants.dart';
export 'route_constants.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case SPLASH_ROUTE:
        return MaterialPageRoute(
          settings: const RouteSettings(name: SPLASH_ROUTE),
          builder: (BuildContext context) => const SplashScreen(),
        );

      case LOGIN_ROUTE:
        return MaterialPageRoute(
          settings: const RouteSettings(name: LOGIN_ROUTE),
          builder: (BuildContext context) => LoginScreen(),
        );

      case HOME_ROUTE:
        return MaterialPageRoute(
          settings: const RouteSettings(name: HOME_ROUTE),
          builder: (BuildContext context) => const HomeScreen(),
        );

      // 404 route.
      default:
        return MaterialPageRoute(
          settings: const RouteSettings(name: '/404'),
          builder: (BuildContext context) => Scaffold(
            appBar: AppBar(),
            body: Container(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  "Error 404: No route defined with this name: \n${routeSettings.name}.",
                ),
              ),
            ),
          ),
        );
    }
  }
}
