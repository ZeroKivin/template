import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/assets/app_theme.dart';
import 'package:template/config/app_config.dart';
import 'package:template/config/environment/environment.dart';
import 'package:template/navigation/navigation.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final environment = Environment<AppConfig>.instance();
    final navigation = context.read<Navigation>();

    return AnimatedBuilder(
      animation: environment,
      builder: (_, __) {
        final debugOptions = environment.config.debugOptions;

        return MaterialApp(
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
          navigatorKey: navigation.rootNavigationKey,
          scaffoldMessengerKey: navigation.scaffoldMessengerKey,
          onGenerateRoute: GenerateRouter.generateRootRoute,
          initialRoute: '/',
        );
      },
    );
  }
}
