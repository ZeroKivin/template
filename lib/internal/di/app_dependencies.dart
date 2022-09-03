import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/feature/debug/screens/debug_screen/debug_screen_export.dart';
import 'package:template/internal/app.dart';
import 'package:template/internal/di/injector.dart';
import 'package:template/navigation/navigation.dart';

class AppDependencies extends StatefulWidget {
  const AppDependencies({
    required this.app,
    Key? key,
  }) : super(key: key);

  final App app;

  @override
  State<AppDependencies> createState() => _AppDependenciesState();
}

class _AppDependenciesState extends State<AppDependencies> {
  final Injector _injector = Injector();
  final Navigation _navigation = Navigation();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Navigation>.value(
          value: _navigation,
        ),
        Provider<DebugScreenModel>(
          create: (_) => _injector.container.resolve(),
        ),
      ],
      child: widget.app,
    );
  }
}
