import 'dart:async';

import 'app/app_runner.dart';
import 'util/logger/logger.dart';

void main() => runZonedGuarded(
      AppRunner().initializeAndRun,
      logger.logZoneError,
    );
