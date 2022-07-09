import 'package:flutter/material.dart';

extension ModalHelper on BuildContext {
  Future<T?> showModal<T>(Widget modal) => showModalBottomSheet<T?>(
        isDismissible: true,
        context: this,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        useRootNavigator: true,
        builder: (BuildContext ctx) => modal,
      );
}
