import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:s_house/common/localization/locale_keys.g.dart';
import 'package:s_house/common/uikit/button/cin_button.dart';
import 'package:s_house/common/uikit/page/cin_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => CinPage(
        title: LocaleKeys.settings_title.tr(),
        children: [
          CinButton(
            onPressed: () async {},
          ),
        ],
      );
}
