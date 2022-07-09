import 'dart:io';

import 'package:path_provider/path_provider.dart';

Future<Directory> appDirectory() async {
  Directory appDir = await getApplicationDocumentsDirectory();
  return Directory('${appDir.path}/cache').create(recursive: true);
}
