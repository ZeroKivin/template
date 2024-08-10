import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../asset/app_theme.dart';
import '../di/dependencies.dart';
import '../environment/environment.dart';
import '../feature/settings/settings.dart';
import '../localization/localization.dart';

class AppContext extends StatelessWidget {
  static final _globalKey = GlobalKey();

  const AppContext({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final environment = Environment.instance();
    final debugOptions = environment.config.debugOptions;
    final mediaQuery = MediaQuery.of(context);

    final settingsController = context.read<Dependencies>().settingsController;

    return ListenableBuilder(
      listenable: environment,
      builder: (_, child) {
        return child ?? const SizedBox.shrink();
      },
      child: StreamBuilder<SettingsState>(
        initialData: settingsController.state,
        stream: settingsController.stream,
        builder: (_, snapshot) {
          final locale = snapshot.requireData.locale;
          final themeMode = snapshot.requireData.themeMode;
          final textScale = snapshot.requireData.textScale;

          return MaterialApp(
            /// Localization
            localizationsDelegates: Localization.localizationDelegates,
            supportedLocales: Localization.supportedLocales,
            locale: locale,

            /// Theme
            theme: AppTheme.light().themeData,
            darkTheme: AppTheme.dark().themeData,
            themeMode: themeMode,

            /// Debug options
            debugShowCheckedModeBanner: debugOptions.debugShowCheckedModeBanner,
            showPerformanceOverlay: debugOptions.showPerformanceOverlay,
            debugShowMaterialGrid: debugOptions.debugShowMaterialGrid,
            checkerboardRasterCacheImages:
                debugOptions.checkerboardRasterCacheImages,
            checkerboardOffscreenLayers:
                debugOptions.checkerboardOffscreenLayers,
            showSemanticsDebugger: debugOptions.showSemanticsDebugger,
            builder: (_, child) => MediaQuery(
              key: _globalKey,
              data: mediaQuery.copyWith(
                textScaler: TextScaler.linear(
                  mediaQuery.textScaler.scale(textScale).clamp(0.5, 2),
                ),
              ),
              child: child ?? const SizedBox.shrink(),
            ),
          );
        },
      ),
    );
  }
}
