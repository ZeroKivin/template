import 'dart:async';

import 'initialization_processor.dart';

abstract interface class InitializationHook {
  FutureOr<void> onInitialize(InitializationResult result);

  FutureOr<void> onInitializeStep(InitializationStepInfo stepInfo);

  FutureOr<void> onInitializeStepError(
    String stepName,
    Object error,
  );
}
