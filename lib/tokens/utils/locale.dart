import 'dart:io';

import 'package:dice_bag/tokens/modules/local_storage/models/local_storage.dart';
import 'package:dice_bag/tokens/modules/local_storage/models/local_storage_paths.dart';

String getStoredLocale() {
  return LocalStorage.getString(LocalStoragePaths.locale) ??
      Platform.localeName.split("_").first;
}

Future<bool> saveLocale(String locale) async {
  return LocalStorage.setString(
    LocalStoragePaths.locale,
    locale,
  );
}
