import 'package:core_architecture/core_architecture.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../asset/app_theme.dart';
import '../di/dependencies.dart';
import '../environment/environment.dart';
import '../localization/localization.dart';

class AppContext extends StatelessWidget {
  static final _globalKey = GlobalKey();

  const AppContext({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final settingController = context.read<Dependencies>().settingController;
    final environment = Environment.instance();
    final debugOptions = environment.config.debugOptions;

    return ListenableBuilder(
      listenable: environment,
      builder: (_, __) {
        return StateWrapperBuilder(
          stateWrapper: settingController,
          builder: (_, state, __) {
            return MaterialApp(
              key: _globalKey,

              /// Localization
              localizationsDelegates: Localization.localizationDelegates,
              supportedLocales: Localization.supportedLocales,
              locale: state.locale,

              /// Theme
              theme: AppTheme.light().themeData,
              darkTheme: AppTheme.dark().themeData,
              themeMode: state.themeMode,

              /// Debug options
              debugShowCheckedModeBanner:
                  debugOptions.debugShowCheckedModeBanner,
              showPerformanceOverlay: debugOptions.showPerformanceOverlay,
              debugShowMaterialGrid: debugOptions.debugShowMaterialGrid,
              checkerboardRasterCacheImages:
                  debugOptions.checkerboardRasterCacheImages,
              checkerboardOffscreenLayers:
                  debugOptions.checkerboardOffscreenLayers,
              showSemanticsDebugger: debugOptions.showSemanticsDebugger,
            );
          },
        );
      },
    );
  }
}
