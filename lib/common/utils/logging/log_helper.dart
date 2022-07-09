import 'log.dart';

extension LogHelper on dynamic {
  void log([dynamic error, StackTrace? stackTrace]) => Log.e(this);

  void errLog([dynamic error, StackTrace? stackTrace]) => Log.e(this);

  void warnLog([dynamic error, StackTrace? stackTrace]) => Log.w(this, error, stackTrace);

  void debugLog([dynamic error, StackTrace? stackTrace]) => Log.d(this, error, stackTrace);

  void infoLog([dynamic error, StackTrace? stackTrace]) => Log.i(this, error, stackTrace);

  void verboseLog([dynamic error, StackTrace? stackTrace]) => Log.v(this, error, stackTrace);

  void wtfLog([dynamic error, StackTrace? stackTrace]) => Log.wtf(this, error, stackTrace);
}
