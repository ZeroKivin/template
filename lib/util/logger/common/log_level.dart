enum LogLevel implements Comparable<LogLevel> {
  fatal(1200),
  error(1000),
  warning(800),
  info(600),
  debug(400),
  verbose(200);

  final int value;

  const LogLevel(this.value);

  @override
  int compareTo(LogLevel other) => value.compareTo(other.value);
}
