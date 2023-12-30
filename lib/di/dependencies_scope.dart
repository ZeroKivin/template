import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dependencies.dart';

class DependenciesScope extends StatelessWidget {
  final Dependencies dependencies;
  final Widget child;

  const DependenciesScope({
    required this.dependencies,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Provider<Dependencies>.value(
      value: dependencies,
      child: child,
    );
  }
}
