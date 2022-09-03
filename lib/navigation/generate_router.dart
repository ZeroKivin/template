import 'package:flutter/material.dart';
import 'package:template/feature/debug/screens/debug_screen/debug_screen.dart';

import 'routes.dart';

//ignore_for_file: avoid-dynamic

abstract class GenerateRouter {
  static Route<dynamic> generateRootRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.debug:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const DebugScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
