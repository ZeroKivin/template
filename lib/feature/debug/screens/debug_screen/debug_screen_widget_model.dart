import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:template/config/debug_options.dart';
import 'package:template/config/url.dart';
import 'package:template/feature/debug/screens/debug_screen/debug_screen.dart';
import 'package:template/feature/debug/screens/debug_screen/debug_screen_model.dart';
import 'package:template/navigation/app_router.dart';

// ignore_for_file: avoid_positional_boolean_parameters

/// Factory for [DebugScreenWidgetModel].
DebugScreenWidgetModel debugScreenWidgetModelFactory(
  BuildContext context,
) {
  return DebugScreenWidgetModel(
    model: context.read<DebugScreenModel>(),
    navigation: context.read<AppRouter>(),
  );
}

/// Widget Model for [DebugScreen].
class DebugScreenWidgetModel extends WidgetModel<DebugScreen, DebugScreenModel>
    implements IDebugScreenWidgetModel {
  /// Create an instance [DebugScreenModel].
  DebugScreenWidgetModel({
    required DebugScreenModel model,
    required this.navigation,
  }) : super(model);

  final AppRouter navigation;

  static const String _emptyString = '';

  final TextEditingController _textEditingController = TextEditingController();
  final StateNotifier<DebugOptions> _debugOptionsState = StateNotifier();
  final StateNotifier<UrlType> _urlState = StateNotifier();

  @override
  TextEditingController get proxyEditingController => _textEditingController;

  @override
  ListenableState<DebugOptions> get debugOptionsState => _debugOptionsState;

  @override
  ListenableState<UrlType> get urlState => _urlState;

  @override
  void initWidgetModel() {
    super.initWidgetModel();

    model.configNotifier.addListener(_updateAppConfig);
    _updateAppConfig();
  }

  @override
  void dispose() {
    model.configNotifier.removeListener(_updateAppConfig);
    super.dispose();
  }

  @override
  void urlChange(UrlType? urlType) => _urlState.accept(urlType);

  @override
  void switchServer(UrlType urlType) {
    model.switchServer(urlType);
  }

  @override
  void showPerformanceOverlayChange(bool value) {
    model.showPerformanceOverlayChange(value);
  }

  @override
  void debugShowMaterialGridChange(bool value) {
    model.debugShowMaterialGridChange(value);
  }

  @override
  void debugShowCheckedModeBannerChange(bool value) {
    model.debugShowCheckedModeBannerChange(value);
  }

  @override
  void checkerboardRasterCacheImagesChange(bool value) {
    model.checkerboardRasterCacheImagesChange(value);
  }

  @override
  void checkerboardOffscreenLayersChange(bool value) {
    model.checkerboardOffscreenLayersChange(value);
  }

  @override
  void showSemanticsDebuggerChange(bool value) {
    model.showSemanticsDebuggerChange(value);
  }

  /// Change proxyUrl value.
  @override
  void setProxy() {
    model.setProxy(proxyEditingController.text);
  }

  void _updateAppConfig() {
    final config = model.configNotifier.value;

    final currentUrl = config.url;
    final proxyUrl = config.proxyUrl;

    if (currentUrl == Url.prodUrl) {
      _urlState.accept(UrlType.prod);
    } else {
      _urlState.accept(UrlType.dev);
    }

    if (proxyUrl != null && proxyUrl.isNotEmpty) {
      proxyEditingController.text = proxyUrl;
    } else {
      proxyEditingController.text = _emptyString;
    }
    _debugOptionsState.accept(config.debugOptions);
  }
}

/// Interface of [DebugScreenWidgetModel].
abstract class IDebugScreenWidgetModel extends IWidgetModel {
  /// Text Editing Controller.
  TextEditingController get proxyEditingController;

  /// Listener current state [DebugOptions].
  ListenableState<DebugOptions> get debugOptionsState;

  /// Listener current state [UrlType].
  ListenableState<UrlType> get urlState;

  /// Change url.
  void urlChange(UrlType? urlType);

  /// Change showPerformanceOverlay value in debugOptions.
  void showPerformanceOverlayChange(bool value);

  /// Change debugShowMaterialGrid value in debugOptions.
  void debugShowMaterialGridChange(bool value);

  /// Change debugShowCheckedModeBanner value in debugOptions.
  void debugShowCheckedModeBannerChange(bool value);

  /// Change checkerboardRasterCacheImages value in debugOptions.
  void checkerboardRasterCacheImagesChange(bool value);

  /// Change checkerboardRasterCacheImages value in debugOptions.
  void checkerboardOffscreenLayersChange(bool value);

  /// Change showSemanticsDebugger value in debugOptions.
  void showSemanticsDebuggerChange(bool value);

  /// Switch server.
  void switchServer(UrlType urlType);

  /// Change proxyUrl value.
  void setProxy();
}

/// Ury type.
enum UrlType {
  /// Prod.
  prod,

  /// Dev.
  dev,
}
