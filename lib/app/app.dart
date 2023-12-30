import 'package:flutter/material.dart';

import '../di/dependencies_scope.dart';
import '../di/initialization/initialization_processor.dart';
import 'app_context.dart';

class App extends StatelessWidget {
  final InitializationResult result;

  const App({
    required this.result,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DependenciesScope(
      dependencies: result.dependencies,
      child: const AppContext(),
    );
  }
}
