class LightImages {
  static const int count = 36;
  static String getPath({required int index}) {
    if (index < 1 && index > count) {
      throw Exception('invalid image index. $index is not in range 1...$count');
    }
    return 'assets/lightImages/$index.svg';
  }
}
