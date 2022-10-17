import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:s_house/common/constants/app_config.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter(AppConfig.name);
  // ignore: avoid_single_cascade_in_expression_statements
  // Hive
  //   ..registerAdapter(ItemAdapter())
  //   ..registerAdapter(MultiLangTextAdapter())
  //   ..registerAdapter(ItemColorAdapter());
  runApp(const App());
}
