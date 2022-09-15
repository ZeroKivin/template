import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/assets/app_theme.dart';
import 'package:template/config/app_config.dart';
import 'package:template/config/environment/environment.dart';
import 'package:template/navigation/app_router.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final environment = Environment<AppConfig>.instance();
    final appRouter = context.read<AppRouter>();
    final scaffoldMessengerKey =
        context.read<GlobalKey<ScaffoldMessengerState>>();

    return AnimatedBuilder(
      animation: environment,
      builder: (_, __) {
        final debugOptions = environment.config.debugOptions;

        return MaterialApp.router(
          /// Debug configuration.
          showPerformanceOverlay: debugOptions.showPerformanceOverlay,
          debugShowMaterialGrid: debugOptions.debugShowMaterialGrid,
          checkerboardRasterCacheImages:
              debugOptions.checkerboardRasterCacheImages,
          checkerboardOffscreenLayers: debugOptions.checkerboardOffscreenLayers,
          showSemanticsDebugger: debugOptions.showSemanticsDebugger,
          debugShowCheckedModeBanner: debugOptions.debugShowCheckedModeBanner,

          /// Theme configuration.
          theme: AppTheme.light().themeData,
          darkTheme: AppTheme.dark().themeData,
          themeMode: ThemeMode.light,

          /// Navigation configuration.
          routerDelegate: appRouter.delegate(),
          routeInformationParser: appRouter.defaultRouteParser(),
          scaffoldMessengerKey: scaffoldMessengerKey,
        );
      },
    );
  }
}
