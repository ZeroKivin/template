import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../environment/environment.dart';
import '../../feature/network/network.dart';
import '../../feature/settings/settings.dart';
import '../../localization/localization.dart';
import '../dependencies.dart';

typedef StepAction = FutureOr<void>? Function(MutableDependencies dependencies);

mixin InitializationSteps {
  final initializationSteps = <String, StepAction>{
    'RestApiClient': (dependencies) {
      final environment = Environment.instance();
      const timeout = Duration(seconds: 30);
      final dio = Dio(
        BaseOptions(
          baseUrl: environment.config.url,
          connectTimeout: timeout,
          receiveTimeout: timeout,
          sendTimeout: timeout,
        ),
      );

      environment.addListener(() {
        dio.options.baseUrl = environment.config.url;
      });

      dependencies.restApiClient = DioRestApiClient(
        dio: dio,
      );
    },
    'SharedPreferences': (dependencies) async {
      final sharedPreferences = await SharedPreferences.getInstance();
      dependencies.sharedPreferences = sharedPreferences;
    },
    'SettingRepository': (dependencies) {
      dependencies.settingsRepository = DefaultSettingsRepository(
        themeModeDataSource: ThemeModeDataSourceLocal(
          sharedPreferences: dependencies.sharedPreferences,
          codec: const ThemeModeCodec(),
        ),
        localeDataSource: LocaleDataSourceLocal(
          sharedPreferences: dependencies.sharedPreferences,
        ),
        textScaleDataSource: TextScaleDataSourceLocal(
          sharedPreferences: dependencies.sharedPreferences,
        ),
      );
    },
    'SettingBloc': (dependencies) async {
      final repository = dependencies.settingsRepository;

      final themeMode = await repository.themeMode;
      final locale = await repository.locale;
      final textScale = await repository.textScale;

      dependencies.settingsController = SettingsBloc(
        settingsRepository: repository,
        initialState: SettingsState(
          locale: locale ?? Localization.computeDefaultLocale(),
          themeMode: themeMode ?? ThemeMode.system,
          textScale: textScale ?? 1,
        ),
      );
    },
  };
}
