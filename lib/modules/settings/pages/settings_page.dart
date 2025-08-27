import 'package:dice_bag/extensions/double_extensions/sized_box_extension.dart';
import 'package:dice_bag/i18n/gen/strings.g.dart';
import 'package:dice_bag/modules/settings/atoms/language_switcher_atom.dart';
import 'package:dice_bag/modules/settings/atoms/theme_mode_switch_atom.dart';
import 'package:dice_bag/tokens/app/app_sizing.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var t = strings.modules.settings;
    // var t = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(t.title)),
      body: ListView(
        children: [
          AppSizing.xxl.sizedBoxH,
          Image.asset(
            "assets/icons/logo/logo.png",
            width: AppSizing.xxxl,
            height: AppSizing.xxxl,
          ),
          AppSizing.xxl.sizedBoxH,
          Divider(),
          ThemeModeSwitchAtom(),
          LanguageSwitcherAtom(),
        ],
      ),
    );
  }
}
