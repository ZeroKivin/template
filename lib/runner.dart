import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:template/internal/app.dart';
import 'package:template/internal/di/app_dependencies.dart';

/// App launch.
Future<void> run() async {
  /// It must be called so that the orientation does not fall.
  WidgetsFlutterBinding.ensureInitialized();

  /// Fix orientation.
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  _runApp();
}

void _runApp() {
  runZonedGuarded<Future<void>>(
    () async {
      runApp(
        const AppDependencies(
          app: App(),
        ),
      );
    },
    (exception, stack) {
      // TODO(init-project): Инициализировать Crashlytics.
      // FirebaseCrashlytics.instance.recordError(exception, stack);
    },
  );
}
