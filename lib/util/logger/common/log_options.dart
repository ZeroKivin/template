import 'log_level.dart';

base class LogOptions {
  final bool colors;
  final bool printEmojis;
  final bool printTime;
  final LogLevel level;
  final bool logInRelease;

  const LogOptions({
    this.colors = true,
    this.printEmojis = true,
    this.printTime = true,
    this.level = LogLevel.verbose,
    this.logInRelease = false,
  });
}
