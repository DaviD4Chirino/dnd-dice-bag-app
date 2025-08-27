import 'package:dice_bag/i18n/gen/strings.g.dart';
import 'package:dice_bag/providers/theme_mode_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ThemeModeSwitchAtom extends ConsumerWidget {
  const ThemeModeSwitchAtom({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeModeProvider = ref.watch(
      themeModeNotifierProvider,
    );
    final themeModeNotifier = ref.read(
      themeModeNotifierProvider.notifier,
    );
    bool isLight = themeModeProvider == ThemeMode.light;

    var t = strings.modules.settings.themeSwitcher;

    // var t = AppLocalizations.of(context);
    return ListTile(
      title: Text(t.title),
      subtitle: Text(
        isLight ? t.subtitle.toDark : t.subtitle.toLight,
      ),
      leading: isLight
          ? Icon(Icons.dark_mode_outlined)
          : Icon(Icons.light_mode_outlined),
      onTap: () => themeModeNotifier.setThemeMode(!isLight),
      trailing: Switch(
        value: isLight,
        onChanged: (value) =>
            themeModeNotifier.setThemeMode(value),
      ),
    );
  }
}
