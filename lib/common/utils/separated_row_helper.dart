import 'package:flutter/material.dart';

extension SeparatedRowHelper on Row {
  Row separated(Widget separator) {
    Row _row = this;
    for (int i = 0; i < _row.children.length; i++) {
      _row.children.insert(i, separator);
    }
    return _row;
  }
}
