import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../di/initialization/initialization_processor.dart';
import '../di/initialization/initialization_steps.dart';
import '../environment/environment.dart';
import '../util/logger/logger.dart';
import 'app.dart';

final class AppRunner with InitializationProcessor, InitializationSteps {
  Future<void> initializeAndRun({
    BuildType buildType = BuildType.debug,
    DebugOptions debugOptions = const DebugOptions(),
  }) async {
    final bindings = WidgetsFlutterBinding.ensureInitialized()
      ..deferFirstFrame();

    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    Environment.initialize<AppConfig>(
      buildType: buildType,
      config: AppConfig(
        url: switch (buildType) {
          BuildType.debug => Url.devUrl,
          BuildType.release => Url.prodUrl,
        },
        debugOptions: debugOptions,
      ),
    );

    FlutterError.onError = logger.logFlutterError;
    PlatformDispatcher.instance.onError = logger.logPlatformDispatcherError;

    final result = await processInitialization(
      steps: initializationSteps,
    );

    bindings.allowFirstFrame();

    runApp(
      App(result: result),
    );
  }
}
