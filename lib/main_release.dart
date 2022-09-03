import 'package:template/config/app_config.dart';
import 'package:template/config/debug_options.dart';
import 'package:template/config/environment/build_type.dart';
import 'package:template/config/environment/environment.dart';
import 'package:template/config/url.dart';
import 'package:template/runner.dart';

/// Main entry point of app.
void main() {
  Environment.init(
    buildType: BuildType.release,
    config: AppConfig(
      url: Url.prodUrl,
      proxyUrl: Url.prodProxyUrl,
      debugOptions: DebugOptions(),
    ),
  );

  run();
}
