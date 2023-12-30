import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../controller/controller.dart';

class ControllerProvider<T extends Controller<Object?>>
    extends InheritedProvider<T> {
  ControllerProvider({
    required Create<T> create,
    bool? lazy,
    TransitionBuilder? builder,
    Widget? child,
    Key? key,
  }) : super(
          create: create,
          dispose: _dispose,
          lazy: lazy,
          builder: builder,
          child: child,
          key: key,
        );

  ControllerProvider.value({
    required T value,
    TransitionBuilder? builder,
    Widget? child,
    Key? key,
  }) : super.value(
          builder: builder,
          value: value,
          child: child,
          key: key,
        );

  static void _dispose(BuildContext context, Controller<Object?> controller) =>
      controller.dispose();
}
