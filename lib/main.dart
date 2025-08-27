import 'package:awesome_flutter_template/i18n/gen/strings.g.dart';
import 'package:awesome_flutter_template/main_app.dart';
import 'package:awesome_flutter_template/tokens/utils/modules/local_storage/models/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializations();
  // LocaleSettings.useDeviceLocaleSync(); // set device locale
  LocaleSettings.useDeviceLocale(); // and this

  runApp(
    ProviderScope(child: TranslationProvider(child: MainApp())),
  );
}

Future<List<void>> initializations() async {
  return Future.wait([LocalStorage.init()]);
}
