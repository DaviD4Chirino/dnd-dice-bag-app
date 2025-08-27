import 'package:dice_bag/i18n/gen/strings.g.dart';
import 'package:dice_bag/tokens/utils/atoms/locale_code_atom.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';

class LanguageSelectorAlertMolecule extends StatelessWidget {
  const LanguageSelectorAlertMolecule({super.key});
  @override
  Widget build(BuildContext context) {
    var t = strings.modules.settings;
    return SimpleDialog(
      title: Text(t.title),
      children: AppLocaleUtils.supportedLocales.map((locale) {
        var languageTag = locale.toLanguageTag();
        var nativeLocaleName =
            LocaleNamesLocalizationsDelegate
                .nativeLocaleNames[languageTag]
                ?.capitalize ??
            languageTag;
        var localizedName =
            LocaleNames.of(
              context,
            )?.nameOf(languageTag)?.capitalize ??
            languageTag;

        return ListTile(
          selected:
              languageTag ==
              LocaleSettings.currentLocale.languageCode,

          onTap: () async {
            LocaleSettings.setLocaleRaw(languageTag);
            Navigator.of(context).pop();
          },
          leading: LocaleCodeAtom(languageTag),
          title: Text("$nativeLocaleName ($localizedName)"),
        );
      }).toList(),
    );
  }
}
