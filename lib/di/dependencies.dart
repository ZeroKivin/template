import 'package:shared_preferences/shared_preferences.dart';

import '../feature/network/rest_api/rest_api_client.dart';
import '../feature/settings/settings.dart';

abstract interface class Dependencies {
  SharedPreferences get sharedPreferences;

  SettingsRepository get settingsRepository;

  SettingsController get settingsController;

  RestApiClient get restApiClient;
}

class MutableDependencies implements Dependencies {
  @override
  late SharedPreferences sharedPreferences;

  @override
  late DefaultSettingsRepository settingsRepository;

  @override
  late SettingsController settingsController;

  @override
  late RestApiClient restApiClient;

  Dependencies freeze() => _FreezedDependencies(
        sharedPreferences: sharedPreferences,
        settingsRepository: settingsRepository,
        settingsController: settingsController,
        restApiClient: restApiClient,
      );
}

class _FreezedDependencies implements Dependencies {
  @override
  final SharedPreferences sharedPreferences;

  @override
  final DefaultSettingsRepository settingsRepository;

  @override
  final SettingsController settingsController;

  @override
  final RestApiClient restApiClient;

  const _FreezedDependencies({
    required this.sharedPreferences,
    required this.settingsRepository,
    required this.settingsController,
    required this.restApiClient,
  });
}
