import 'dart:ui';

class AppConfig {
  static const String name = 'S House';

  static const String baseUrl = 'http://192.168.1.184';

  static const String username = 'ShahanSharkDoDooDoDooDoDooo';

  static const String password = 'ldVOhVb&TVze3SiQp78h^Q0H8Hi^8';

  static const bool debug = true;

  static const String localePath = 'resources/langs';
  static const List<Locale> supportedLocales = <Locale>[
    Locale('fa', 'IR'),
    Locale('en', 'US'),
  ];
  static Locale startLocale = supportedLocales.first;
}
