import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../environment/environment.dart';
import '../../feature/network/rest_api/rest_api_client.dart';
import '../../feature/setting/controller/setting_controller.dart';
import '../../feature/setting/repository/data_source/locale/locale_data_source.dart';
import '../../feature/setting/repository/data_source/theme_mode/theme_mode_codec.dart';
import '../../feature/setting/repository/data_source/theme_mode/theme_mode_data_source.dart';
import '../../feature/setting/repository/setting_repository.dart';
import '../../feature/setting/state/setting_state.dart';
import '../../localization/localization.dart';
import '../dependencies.dart';

typedef StepAction = FutureOr<void>? Function(MutableDependencies dependencies);

mixin InitializationSteps {
  final initializationSteps = <String, StepAction>{
    'Rest Api Client': (dependencies) {
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

      dependencies.restApiClient = RestApiClient.dio(dio: dio);
    },
    'Shared Preferences': (dependencies) async {
      final sharedPreferences = await SharedPreferences.getInstance();
      dependencies.sharedPreferences = sharedPreferences;
    },
    'Setting Repository': (dependencies) {
      dependencies.settingsRepository = SettingsRepository(
        themeModeDataSource: ThemeModeDataSource.local(
          sharedPreferences: dependencies.sharedPreferences,
          codec: const ThemeModeCodec(),
        ),
        localeDataSource: LocaleDataSource.local(
          sharedPreferences: dependencies.sharedPreferences,
        ),
      );
    },
    'Setting Controller': (dependencies) async {
      final repository = dependencies.settingsRepository;

      final themeMode = await repository.getThemeMode();
      final locale = await repository.getLocale();

      dependencies.settingController = SettingController(
        initialState: SettingState(
          locale: locale ?? Localization.computeDefaultLocale(),
          themeMode: themeMode ?? ThemeMode.system,
        ),
        settingsRepository: repository,
      );
    },
  };
}
