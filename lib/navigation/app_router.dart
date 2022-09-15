import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:template/feature/debug/screens/debug_screen/debug_screen_export.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(
      page: DebugScreen,
      name: 'DebugRoute',
      path: 'debug',
    ),
  ],
)

// ignore: avoid-dynamic
class AppRouter extends _$AppRouter {}
