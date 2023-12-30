import 'dart:async';

import 'app/app_runner.dart';
import 'environment/build_type.dart';
import 'environment/config/debug_options.dart';
import 'util/logger/logger.dart';

void main() => runZonedGuarded(
      () => AppRunner().initializeAndRun(
        buildType: BuildType.release,
        debugOptions: const DebugOptions(
          debugShowCheckedModeBanner: false,
        ),
      ),
      logger.logZoneError,
    );
