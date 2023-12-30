import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'generated/l10n.dart';

final class Localization extends GeneratedLocalization {
  final Locale locale;

  static Localization? _current;

  static const localizationDelegate = _LocalizationDelegate(
    AppLocalizationDelegate(),
  );

  Localization._({
    required this.locale,
  });

  static Localization? get current => _current;

  static List<Locale> get supportedLocales =>
      const AppLocalizationDelegate().supportedLocales;

  static List<LocalizationsDelegate<void>> get localizationDelegates => [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        Localization.localizationDelegate,
      ];

  static Locale computeDefaultLocale() {
    final locale = WidgetsBinding.instance.platformDispatcher.locale;

    if (const AppLocalizationDelegate().isSupported(locale)) {
      return locale;
    }

    return const Locale('en');
  }

  static Localization of(BuildContext context) {
    final localization = Localizations.of<Localization>(context, Localization);

    if (localization == null) {
      throw ArgumentError('No Localization found in context');
    }

    return localization;
  }
}

final class _LocalizationDelegate extends LocalizationsDelegate<Localization> {
  final AppLocalizationDelegate _delegate;

  const _LocalizationDelegate(
    this._delegate,
  );

  @override
  bool isSupported(Locale locale) => _delegate.isSupported(locale);

  @override
  Future<Localization> load(Locale locale) =>
      GeneratedLocalization.load(locale).then(
        (value) => Localization._current = Localization._(locale: locale),
      );

  @override
  bool shouldReload(_LocalizationDelegate old) => false;
}
