import 'package:flutter/material.dart';
import 'package:network_security_algorithms_app/core/routing/routes.dart';
import 'package:network_security_algorithms_app/features/Euclidean/euclidean_screen.dart';

import '../../features/Ceaser Cypher/ceaser_cypher_screen.dart';
import '../../features/home/ui/home_screen.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case Routes.ceaserCypherScreen:
        return MaterialPageRoute(
          builder: (context) => const CeaserCypherScreen(),
        );
      case Routes.euclideanScreen:
        return MaterialPageRoute(
          builder: (context) => const EuclideanScreen(),
        );
      default:
        return MaterialPageRoute(
          builder:
              (context) => Scaffold(
                body: Center(child: Text("no route for ${settings.name}")),
              ),
        );
    }
  }
}
