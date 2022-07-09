extension DoubleHelper on double {
  String get withoutZeroDecimal => toStringAsFixed(truncateToDouble() == this ? 0 : 1);
}
