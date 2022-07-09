import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:s_house/common/localization/locale_keys.g.dart';
import 'package:s_house/common/uikit/button/cin_button.dart';
import 'package:s_house/common/utils/locale_helper.dart';

class CinPageFooter extends StatelessWidget {
  const CinPageFooter(
      {required this.onSubmit,
      Key? key,
      this.onCancel,
      this.submitText,
      this.cancelText,
      this.invert = false})
      : super(key: key);

  final AsyncCallback onSubmit;
  final AsyncCallback? onCancel;
  final String? submitText;
  final String? cancelText;
  final bool invert;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.fromLTRB(4, 2, 4, 4),
        child: Row(
          textDirection:
              invert ? context.invertLocaleDirection : context.localeDirection,
          children: [
            Expanded(
              flex: 3,
              child: CinButton(
                onPressed: onSubmit,
                text: submitText ?? LocaleKeys.common_button_submit.tr(),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              flex: 2,
              child: CinButton(
                onPressed: onCancel ??
                    () async {
                      Navigator.of(context).pop();
                    },
                type: ButtonType.secondary,
                text: cancelText ?? LocaleKeys.common_button_cancel.tr(),
              ),
            ),
          ],
        ),
      );
}
