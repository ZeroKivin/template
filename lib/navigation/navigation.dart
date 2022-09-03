// ignore_for_file: inference_failure_on_instance_creation

import 'package:flutter/material.dart';
import 'package:template/navigation/route_bundle.dart';

export 'generate_router.dart';
export 'route_bundle.dart';
export 'routes.dart';

class Navigation extends ChangeNotifier {
  /// Navigation key for root navigator.
  final GlobalKey<NavigatorState> _rootNavigationKey =
      GlobalKey<NavigatorState>();

  /// Key for scaffold messenger.
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  GlobalKey<NavigatorState> get rootNavigationKey => _rootNavigationKey;

  GlobalKey<ScaffoldMessengerState> get scaffoldMessengerKey =>
      _scaffoldMessengerKey;

  /// Push new screen.
  Future<T?> routeTo<T extends Object?>(RouteBundle bundle) async {
    return await _rootNavigationKey.currentState?.pushNamed<T>(
      bundle.route,
      arguments: bundle.data,
    );
  }

  /// Push replacement new screen.
  Future<T?> routeReplacementTo<T extends Object?>(RouteBundle bundle) async {
    return await _rootNavigationKey.currentState?.pushReplacementNamed(
      bundle.route,
      arguments: bundle.data,
    );
  }

  /// Push new screen and remove until.
  Future<T?> routeToAndRemoveUntil<T extends Object?>(
    RouteBundle bundle,
  ) async {
    return await _rootNavigationKey.currentState?.pushNamedAndRemoveUntil(
      bundle.route,
      (route) => route.isFirst,
      arguments: bundle.data,
    );
  }

  /// Pop current screen if it can.
  Future<bool?> routeBack({
    Object? data,
  }) async {
    return await _rootNavigationKey.currentState?.maybePop(data);
  }

  /// Pop current screen to provided screen. Can't transport data!
  void routeBackTo(RouteBundle bundle) {
    _rootNavigationKey.currentState?.popUntil(
      ModalRoute.withName(bundle.route),
    );
  }

  /// Pop current screen and then push new one.
  Future<T?> routeBackThenTo<T extends Object?>(RouteBundle bundle) async {
    return await _rootNavigationKey.currentState?.popAndPushNamed(
      bundle.route,
      arguments: bundle.data,
    );
  }

  /// Display snack bar with some information message.
  void displayInfoSnackBar(String message) {
    _scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  /// Display snack bar with some error message.
  void displayErrorSnackBar(String message) {
    _scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  /// Display material banner.
  void displayMaterialBanner(MaterialBanner materialBanner) {
    _scaffoldMessengerKey.currentState?.showMaterialBanner(materialBanner);
  }
}
