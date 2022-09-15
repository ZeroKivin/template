import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/feature/debug/screens/debug_screen/debug_screen_export.dart';
import 'package:template/internal/app.dart';
import 'package:template/internal/di/injector.dart';
import 'package:template/navigation/app_router.dart';

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

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppRouter>(
          create: (_) => AppRouter(),
        ),
        Provider<GlobalKey<ScaffoldMessengerState>>(
          create: (_) => GlobalKey<ScaffoldMessengerState>(),
        ),
        Provider<DebugScreenModel>.value(
          value: _injector.container.resolve(),
        ),
      ],
      child: widget.app,
    );
  }
}
