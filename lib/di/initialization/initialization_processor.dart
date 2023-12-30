import '../dependencies.dart';
import 'initialization_hook.dart';
import 'initialization_steps.dart';

mixin InitializationProcessor {
  Future<InitializationResult> processInitialization({
    required Map<String, StepAction> steps,
    InitializationHook? hook,
  }) async {
    final dependencies = MutableDependencies();

    final initializationStopwatch = Stopwatch()..start();
    var stepIndex = 0;

    try {
      await for (final step in Stream.fromIterable(steps.entries)) {
        final stepStopwatch = Stopwatch()..start();
        await step.value(dependencies);
        stepStopwatch.stop();

        hook?.onInitializeStep(
          InitializationStepInfo(
            stepName: step.key,
            initializationTime: stepStopwatch.elapsedMilliseconds,
          ),
        );

        stepIndex++;
      }
    } on Object catch (e) {
      hook?.onInitializeStepError(
        steps.keys.elementAt(stepIndex),
        e,
      );

      rethrow;
    }

    initializationStopwatch.stop();

    final result = InitializationResult(
      dependencies: dependencies.freeze(),
      stepCount: stepIndex,
      initializationTime: initializationStopwatch.elapsedMilliseconds,
    );

    hook?.onInitialize(result);

    return result;
  }
}

class InitializationResult {
  final Dependencies dependencies;
  final int stepCount;
  final int initializationTime;

  const InitializationResult({
    required this.dependencies,
    required this.stepCount,
    required this.initializationTime,
  });
}

class InitializationStepInfo {
  final String stepName;
  final int initializationTime;

  const InitializationStepInfo({
    required this.stepName,
    required this.initializationTime,
  });
}
