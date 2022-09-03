import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';
import 'package:template/config/app_config.dart';
import 'package:template/config/debug_options.dart';
import 'package:template/config/environment/environment.dart';
import 'package:template/config/url.dart';
import 'package:template/feature/debug/screens/debug_screen/debug_screen.dart';
import 'package:template/feature/debug/screens/debug_screen/debug_screen_widget_model.dart';

// ignore_for_file: avoid_positional_boolean_parameters

/// Model for [DebugScreen].
class DebugScreenModel extends ElementaryModel {
  /// Create an instance [DebugScreenModel].
  DebugScreenModel({
    required this.errorHandler,
    required this.environment,
  }) : super(errorHandler: errorHandler);

  /// Interface for handle error in business logic.
  final ErrorHandler errorHandler;

  /// Environment configuration.
  final Environment<AppConfig> environment;

  /// Config change Notifier.
  late ValueNotifier<AppConfig> configNotifier;

  @override
  void init() {
    configNotifier = ValueNotifier<AppConfig>(environment.config);
    environment.addListener(_environmentChangedCallback);
  }

  @override
  void dispose() {
    environment.removeListener(_environmentChangedCallback);
  }

  /// Switch server.
  void switchServer(UrlType urlType) {
    AppConfig newConfig;
    switch (urlType) {
      case UrlType.prod:
        newConfig = configNotifier.value.copyWith(url: Url.prodUrl);
        break;
      default:
        newConfig = configNotifier.value.copyWith(url: Url.devUrl);
        break;
    }
    _setConfig(newConfig);
  }

  /// Change showPerformanceOverlay value in debugOptions.
  void showPerformanceOverlayChange(bool value) {
    _setDebugOptionState(
      configNotifier.value.debugOptions.copyWith(showPerformanceOverlay: value),
    );
  }

  /// Change debugShowMaterialGrid value in debugOptions.
  void debugShowMaterialGridChange(bool value) {
    _setDebugOptionState(
      configNotifier.value.debugOptions.copyWith(debugShowMaterialGrid: value),
    );
  }

  /// Change debugShowCheckedModeBanner value in debugOptions.
  void debugShowCheckedModeBannerChange(bool value) {
    _setDebugOptionState(
      configNotifier.value.debugOptions
          .copyWith(debugShowCheckedModeBanner: value),
    );
  }

  /// Change checkerboardRasterCacheImages value in debugOptions.
  void checkerboardRasterCacheImagesChange(bool value) {
    _setDebugOptionState(
      configNotifier.value.debugOptions
          .copyWith(checkerboardRasterCacheImages: value),
    );
  }

  /// Change checkerboardOffscreenLayers value in debugOptions.
  void checkerboardOffscreenLayersChange(bool value) {
    _setDebugOptionState(
      configNotifier.value.debugOptions
          .copyWith(checkerboardOffscreenLayers: value),
    );
  }

  /// Change showSemanticsDebugger value in debugOptions.
  void showSemanticsDebuggerChange(bool value) {
    _setDebugOptionState(
      configNotifier.value.debugOptions.copyWith(showSemanticsDebugger: value),
    );
  }

  /// Change proxyUrl value.
  void setProxy(String? proxyUrl) {
    _setConfig(
      configNotifier.value.copyWith(
        proxyUrl: proxyUrl,
      ),
    );
  }

  void _setDebugOptionState(DebugOptions newOpt) {
    _setConfig(configNotifier.value.copyWith(debugOptions: newOpt));
  }

  // ignore: use_setters_to_change_properties
  void _setConfig(AppConfig newConfig) {
    environment.config = newConfig;
  }

  void _environmentChangedCallback() {
    configNotifier.value = environment.config;
  }
}
