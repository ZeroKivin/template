/// Additional application settings in debug mode.
final class DebugOptions {
  /// Show performance overlay.
  final bool showPerformanceOverlay;

  /// Show material grid.
  final bool debugShowMaterialGrid;

  /// Checkerboard raster cache images.
  final bool checkerboardRasterCacheImages;

  /// Checkerboard offscreen layers.
  final bool checkerboardOffscreenLayers;

  /// Show semantics debugger.
  final bool showSemanticsDebugger;

  /// Debug show checked mode banner.
  final bool debugShowCheckedModeBanner;

  const DebugOptions({
    this.showPerformanceOverlay = false,
    this.debugShowMaterialGrid = false,
    this.checkerboardRasterCacheImages = false,
    this.checkerboardOffscreenLayers = false,
    this.showSemanticsDebugger = false,
    this.debugShowCheckedModeBanner = true,
  });

  /// Create an instance [DebugOptions] with modified parameters.
  DebugOptions copyWith({
    bool? showPerformanceOverlay,
    bool? debugShowMaterialGrid,
    bool? checkerboardRasterCacheImages,
    bool? checkerboardOffscreenLayers,
    bool? showSemanticsDebugger,
    bool? debugShowCheckedModeBanner,
  }) =>
      DebugOptions(
        showPerformanceOverlay:
            showPerformanceOverlay ?? this.showPerformanceOverlay,
        checkerboardOffscreenLayers:
            checkerboardOffscreenLayers ?? this.checkerboardOffscreenLayers,
        checkerboardRasterCacheImages:
            checkerboardRasterCacheImages ?? this.checkerboardRasterCacheImages,
        debugShowCheckedModeBanner:
            debugShowCheckedModeBanner ?? this.debugShowCheckedModeBanner,
        debugShowMaterialGrid:
            debugShowMaterialGrid ?? this.debugShowMaterialGrid,
        showSemanticsDebugger:
            showSemanticsDebugger ?? this.showSemanticsDebugger,
      );
}
