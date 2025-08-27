import 'package:awesome_flutter_template/i18n/gen/strings.g.dart';
import 'package:awesome_flutter_template/modules/settings/molecules/language_selector_alert_molecule.dart';
import 'package:awesome_flutter_template/tokens/utils/atoms/locale_code_atom.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LanguageSwitcherAtom extends HookConsumerWidget {
  const LanguageSwitcherAtom({super.key});

  /* @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  } */

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var t = strings.modules.settings;
    return ListTile(
      title: Text(t.languageSwitcher.title),
      leading: const Icon(Icons.translate),
      trailing: LocaleCodeAtom(
        TranslationProvider.of(
          context,
        ).flutterLocale.toLanguageTag(),
      ),
      subtitle: Text(t.languageSwitcher.subtitle),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) =>
              const LanguageSelectorAlertMolecule(),
        );
      },
    );
  }
}
