// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    DebugRoute.name: (routeData) {
      final args = routeData.argsAs<DebugRouteArgs>(
          orElse: () => const DebugRouteArgs());
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: DebugScreen(key: args.key, wmFactory: args.wmFactory));
    }
  };

  @override
  List<RouteConfig> get routes => [RouteConfig(DebugRoute.name, path: '/')];
}

/// generated route for
/// [DebugScreen]
class DebugRoute extends PageRouteInfo<DebugRouteArgs> {
  DebugRoute(
      {Key? key,
      WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
              BuildContext)
          wmFactory = debugScreenWidgetModelFactory})
      : super(DebugRoute.name,
            path: '/', args: DebugRouteArgs(key: key, wmFactory: wmFactory));

  static const String name = 'DebugRoute';
}

class DebugRouteArgs {
  const DebugRouteArgs(
      {this.key, this.wmFactory = debugScreenWidgetModelFactory});

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'DebugRouteArgs{key: $key, wmFactory: $wmFactory}';
  }
}
