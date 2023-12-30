import 'package:shared_preferences/shared_preferences.dart';

import '../feature/network/rest_api/rest_api_client.dart';
import '../feature/setting/controller/setting_controller.dart';
import '../feature/setting/repository/setting_repository.dart';

abstract interface class Dependencies {
  SharedPreferences get sharedPreferences;

  SettingsRepository get settingsRepository;

  SettingController get settingController;

  RestApiClient get restApiClient;
}

class MutableDependencies implements Dependencies {
  @override
  late SharedPreferences sharedPreferences;

  @override
  late SettingsRepository settingsRepository;

  @override
  late SettingController settingController;
  @override
  late RestApiClient restApiClient;

  Dependencies freeze() => FreezedDependencies(
        sharedPreferences: sharedPreferences,
        settingsRepository: settingsRepository,
        settingController: settingController,
        restApiClient: restApiClient,
      );
}

class FreezedDependencies implements Dependencies {
  @override
  final SharedPreferences sharedPreferences;

  @override
  final SettingsRepository settingsRepository;

  @override
  final SettingController settingController;
  @override
  final RestApiClient restApiClient;

  const FreezedDependencies({
    required this.sharedPreferences,
    required this.settingsRepository,
    required this.settingController,
    required this.restApiClient,
  });
}
