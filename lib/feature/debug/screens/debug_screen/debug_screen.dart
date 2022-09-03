import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:template/config/debug_options.dart';
import 'package:template/config/url.dart';
import 'package:template/feature/debug/screens/debug_screen/debug_screen_widget_model.dart';

/// Debug screens.
class DebugScreen extends ElementaryWidget<IDebugScreenWidgetModel> {
  /// Create an instance [DebugScreen].
  const DebugScreen({
    Key? key,
    WidgetModelFactory wmFactory = debugScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IDebugScreenWidgetModel wm) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Экран отладки',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: _Body(
        debugOptionsState: wm.debugOptionsState,
        urlState: wm.urlState,
        urlChanged: wm.urlChange,
        showPerformanceOverlayChange: wm.showPerformanceOverlayChange,
        debugShowMaterialGridChange: wm.debugShowMaterialGridChange,
        debugShowCheckedModeBannerChange: wm.debugShowCheckedModeBannerChange,
        checkerboardRasterCacheImagesChange:
            wm.checkerboardRasterCacheImagesChange,
        checkerboardOffscreenLayersChange: wm.checkerboardOffscreenLayersChange,
        showSemanticsDebuggerChange: wm.showSemanticsDebuggerChange,
        switchServer: wm.switchServer,
        setProxy: wm.setProxy,
        proxyController: wm.proxyEditingController,
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    required this.debugOptionsState,
    required this.urlState,
    required this.urlChanged,
    required this.showPerformanceOverlayChange,
    required this.debugShowMaterialGridChange,
    required this.debugShowCheckedModeBannerChange,
    required this.checkerboardRasterCacheImagesChange,
    required this.checkerboardOffscreenLayersChange,
    required this.showSemanticsDebuggerChange,
    required this.switchServer,
    required this.setProxy,
    required this.proxyController,
    Key? key,
  }) : super(key: key);

  final ListenableState<DebugOptions> debugOptionsState;
  final ListenableState<UrlType> urlState;
  final void Function(UrlType?) urlChanged;
  final void Function(bool) showPerformanceOverlayChange;
  final void Function(bool) debugShowMaterialGridChange;
  final void Function(bool) debugShowCheckedModeBannerChange;
  final void Function(bool) checkerboardRasterCacheImagesChange;
  final void Function(bool) checkerboardOffscreenLayersChange;
  final void Function(bool) showSemanticsDebuggerChange;
  final void Function(UrlType) switchServer;
  final void Function() setProxy;
  final TextEditingController proxyController;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: [
        _PerformanceOverlayCard(
          debugOptionsState: debugOptionsState,
          showPerformanceOverlayChange: showPerformanceOverlayChange,
          debugShowMaterialGridChange: debugShowMaterialGridChange,
          debugShowCheckedModeBannerChange: debugShowCheckedModeBannerChange,
          checkerboardRasterCacheImagesChange:
              checkerboardRasterCacheImagesChange,
          checkerboardOffscreenLayersChange: checkerboardOffscreenLayersChange,
          showSemanticsDebuggerChange: showSemanticsDebuggerChange,
        ),
        _ServerSwitchCard(
          urlState: urlState,
          urlChange: urlChanged,
          switchServer: switchServer,
        ),
        _ProxyCard(
          setProxy: setProxy,
          proxyController: proxyController,
        ),
      ],
    );
  }
}

class _PerformanceOverlayCard extends StatelessWidget {
  const _PerformanceOverlayCard({
    required this.debugOptionsState,
    required this.showPerformanceOverlayChange,
    required this.debugShowMaterialGridChange,
    required this.debugShowCheckedModeBannerChange,
    required this.checkerboardRasterCacheImagesChange,
    required this.checkerboardOffscreenLayersChange,
    required this.showSemanticsDebuggerChange,
    Key? key,
  }) : super(key: key);

  final ListenableState<DebugOptions> debugOptionsState;
  final void Function(bool) showPerformanceOverlayChange;
  final void Function(bool) debugShowMaterialGridChange;
  final void Function(bool) debugShowCheckedModeBannerChange;
  final void Function(bool) checkerboardRasterCacheImagesChange;
  final void Function(bool) checkerboardOffscreenLayersChange;
  final void Function(bool) showSemanticsDebuggerChange;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            const Text('Диагностика'),
            StateNotifierBuilder<DebugOptions>(
              listenableState: debugOptionsState,
              builder: (_, debugOptions) {
                if (debugOptions == null) {
                  return const SizedBox.shrink();
                }

                return Column(
                  children: [
                    _SwitchTitle(
                      title: 'Включить наложение производительности',
                      value: debugOptions.showPerformanceOverlay,
                      onChanged: showPerformanceOverlayChange,
                    ),
                    _SwitchTitle(
                      title: 'Включить наложение базовой сетки',
                      value: debugOptions.debugShowMaterialGrid,
                      onChanged: debugShowMaterialGridChange,
                    ),
                    _SwitchTitle(
                      title: 'Показать debug баннер',
                      value: debugOptions.debugShowCheckedModeBanner,
                      onChanged: debugShowCheckedModeBannerChange,
                    ),
                    _SwitchTitle(
                      title: 'Включить проверку изображений растрового кэша',
                      value: debugOptions.checkerboardRasterCacheImages,
                      onChanged: checkerboardRasterCacheImagesChange,
                    ),
                    _SwitchTitle(
                      title:
                          'Включает проверку слоев, отображаемых в закадровых '
                          'растровых изображениях.',
                      value: debugOptions.checkerboardOffscreenLayers,
                      onChanged: checkerboardOffscreenLayersChange,
                    ),
                    _SwitchTitle(
                      title:
                          'Включает наложение, которое показывает информацию о '
                          'доступности, сообщаемую платформой.',
                      value: debugOptions.showSemanticsDebugger,
                      onChanged: showSemanticsDebuggerChange,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _SwitchTitle extends StatelessWidget {
  const _SwitchTitle({
    required this.title,
    required this.value,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  final String title;
  final bool value;
  final void Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}

class _ServerSwitchCard extends StatelessWidget {
  const _ServerSwitchCard({
    required this.urlState,
    required this.urlChange,
    required this.switchServer,
    Key? key,
  }) : super(key: key);

  final ListenableState<UrlType> urlState;
  final void Function(UrlType?) urlChange;
  final void Function(UrlType) switchServer;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            const Text('Сервер'),
            StateNotifierBuilder<UrlType>(
              listenableState: urlState,
              builder: (_, urlState) {
                return Column(
                  children: [
                    RadioListTile<UrlType>(
                      groupValue: urlState,
                      title: Text(UrlType.prod.toString()),
                      subtitle: Text(Url.prodUrl),
                      value: UrlType.prod,
                      onChanged: urlChange,
                    ),
                    RadioListTile<UrlType>(
                      groupValue: urlState,
                      title: Text(UrlType.dev.toString()),
                      subtitle: Text(Url.devUrl),
                      value: UrlType.dev,
                      onChanged: urlChange,
                    ),
                    MaterialButton(
                      onPressed: () => switchServer(urlState!),
                      child: const Text(
                        'Переключить',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ProxyCard extends StatelessWidget {
  const _ProxyCard({
    required this.setProxy,
    required this.proxyController,
    Key? key,
  }) : super(key: key);

  final void Function() setProxy;
  final TextEditingController proxyController;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Text('Прокси-сервер'),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Text('Активирует передачу трафика через прокси сервер.'),
            ),
            Column(
              children: [
                TextField(
                  textInputAction: TextInputAction.done,
                  onSubmitted: (_) {
                    setProxy();
                  },
                  controller: proxyController,
                  decoration: const InputDecoration(
                    filled: true,
                    border: UnderlineInputBorder(),
                    labelText: 'Адрес прокси сервера',
                    hintText: '192.168.0.1:8888',
                  ),
                ),
                MaterialButton(
                  onPressed: setProxy,
                  child: const Text(
                    'Переключить прокси',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
