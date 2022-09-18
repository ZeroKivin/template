import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
        Provider<ErrorHandler>.value(
          value: _injector.resolve<ErrorHandler>(),
        ),
      ],
      child: widget.app,
    );
  }
}
