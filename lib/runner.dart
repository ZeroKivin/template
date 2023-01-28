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

  // TODO(init-project): Инициализировать Crashlytics.
  /*FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack);

    return true;
  };*/

  runApp(
    const AppDependencies(
      app: App(),
    ),
  );
}
