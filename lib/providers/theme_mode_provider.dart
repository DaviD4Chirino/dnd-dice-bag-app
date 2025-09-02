import 'package:dice_bag/tokens/modules/local_storage/models/local_storage.dart';
import 'package:dice_bag/tokens/modules/local_storage/models/local_storage_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'gen/theme_mode_provider.g.dart';

@Riverpod(keepAlive: true)
class ThemeModeNotifier extends _$ThemeModeNotifier {
  @override
  ThemeMode build() {
    if (LocalStorage.getBool(LocalStoragePaths.themeMode) ==
        null) {
      return SchedulerBinding
                  .instance
                  .platformDispatcher
                  .platformBrightness ==
              Brightness.dark
          ? ThemeMode.dark
          : ThemeMode.light;
    } else {
      return LocalStorage.getBool(LocalStoragePaths.themeMode)!
          ? ThemeMode.light
          : ThemeMode.dark;
    }
  }

  void setThemeMode(bool lightMode) {
    if (lightMode) {
      setLight();
      return;
    }
    setDark();
  }

  void setDark() {
    state = ThemeMode.dark;
    _setStatusBarColor();
    LocalStorage.setBool(LocalStoragePaths.themeMode, false);
  }

  void setLight() {
    state = ThemeMode.light;
    _setStatusBarColor();
    LocalStorage.setBool(LocalStoragePaths.themeMode, true);
  }

  void _setStatusBarColor() {
    SystemUiOverlayStyle brightness =
        state == ThemeMode.light || state == ThemeMode.system
        ? SystemUiOverlayStyle.dark
        : SystemUiOverlayStyle.light;

    SystemChrome.setSystemUIOverlayStyle(brightness);
  }
}
