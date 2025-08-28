import 'package:dice_bag/providers/theme_mode_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

mixin ConsumerMixin {
  bool isLightMode(WidgetRef ref) {
    return ref.watch(themeModeNotifierProvider) ==
        ThemeMode.light;
  }
}
