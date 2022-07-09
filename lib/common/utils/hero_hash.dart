import 'dart:math';

class HeroHash {
  static String fromString(String? string, {String? tag}) =>
      '${tag ?? ''}${string ?? Random().nextInt(9999 - 1000)}'.hashCode.toString();
}
