import '../../../../../../util/cache/cache_dao.dart';
import '../text_scale_data_source.dart';

final class TextScaleDataSourceLocal extends CacheDao
    implements TextScaleDataSource {
  late final CacheEntry<double> _textScale = doubleEntry('settings.text_scale');

  TextScaleDataSourceLocal({
    required super.sharedPreferences,
  });

  @override
  Future<double?> get textScale => _textScale.read();

  @override
  Future<void> setTextScale(double textScale) => _textScale.set(textScale);
}
