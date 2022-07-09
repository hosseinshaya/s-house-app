import 'dart:ui';

class AppConfig {
  static const String name = 'S House';

  static const String baseUrl = 'https://api.paybuy.ir/';

  static const bool debug = true;

  static const String localePath = 'resources/langs';
  static const List<Locale> supportedLocales = <Locale>[
    Locale('fa', 'IR'),
    Locale('en', 'US'),
  ];
  static Locale startLocale = supportedLocales.first;
}
