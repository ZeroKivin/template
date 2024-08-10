import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'generated/l10n.dart';

final class Localization extends GeneratedLocalization {
  final Locale locale;

  static const localizationDelegate = _LocalizationDelegate();
  static Localization? _current;

  Localization._({
    required this.locale,
  });

  static Localization? get current => _current;

  static List<Locale> get supportedLocales {
    return GeneratedLocalization.delegate.supportedLocales;
  }

  static List<LocalizationsDelegate<void>> get localizationDelegates => [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        Localization.localizationDelegate,
      ];

  static Locale computeDefaultLocale() {
    final locale = WidgetsBinding.instance.platformDispatcher.locale;

    if (GeneratedLocalization.delegate.isSupported(locale)) {
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
  const _LocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    return GeneratedLocalization.delegate.isSupported(locale);
  }

  @override
  Future<Localization> load(Locale locale) {
    return GeneratedLocalization.load(locale).then(
      (value) => Localization._current = Localization._(locale: locale),
    );
  }

  @override
  bool shouldReload(_LocalizationDelegate old) => false;
}
