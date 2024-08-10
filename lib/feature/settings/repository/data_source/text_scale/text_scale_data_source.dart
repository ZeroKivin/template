import 'dart:async';

abstract interface class TextScaleDataSource {
  Future<double?> get textScale;

  Future<void> setTextScale(double textScale);
}
