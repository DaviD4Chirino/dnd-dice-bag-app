import 'package:dice_bag/i18n/gen/strings.g.dart';
import 'package:dice_bag/main_app.dart';
import 'package:dice_bag/tokens/modules/local_storage/models/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializations();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  // LocaleSettings.useDeviceLocaleSync(); // set device locale
  LocaleSettings.useDeviceLocale(); // and this

  runApp(
    ProviderScope(child: TranslationProvider(child: MainApp())),
  );
}

Future<List<void>> initializations() async {
  return Future.wait([LocalStorage.init()]);
}
