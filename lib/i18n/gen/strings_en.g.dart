///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element

class Translations
    implements BaseTranslations<AppLocale, Translations> {
  /// Returns the current translations of the given [context].
  ///
  /// Usage:
  /// final strings = Translations.of(context);
  static Translations of(BuildContext context) =>
      InheritedLocaleData.of<AppLocale, Translations>(
        context,
      ).translations;

  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  Translations({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : assert(
         overrides == null,
         'Set "translation_overrides: true" in order to enable this feature.',
       ),
       $meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.en,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ) {
    $meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <en>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  /// Access flat map
  dynamic operator [](String key) => $meta.getTranslation(key);

  late final Translations _root = this; // ignore: unused_field

  Translations $copyWith({
    TranslationMetadata<AppLocale, Translations>? meta,
  }) => Translations(meta: meta ?? this.$meta);

  // Translations

  /// en: 'Awesome Flutter Template'
  String get appName => 'Awesome Flutter Template';

  late final TranslationsModulesEn modules =
      TranslationsModulesEn._(_root);
}

// Path: modules
class TranslationsModulesEn {
  TranslationsModulesEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final TranslationsModulesHomeEn home =
      TranslationsModulesHomeEn._(_root);
  late final TranslationsModulesSettingsEn settings =
      TranslationsModulesSettingsEn._(_root);
}

// Path: modules.home
class TranslationsModulesHomeEn {
  TranslationsModulesHomeEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Home'
  String get title => 'Home';

  /// en: 'Increment'
  String get FABTooltip => 'Increment';

  /// en: 'Counter'
  String get counterTitle => 'Counter';

  /// en: '(zero) {You have not clicked on any time} (one) {You have clicked on $ time} (other) {You have clicked on $ times}'
  String counter({required num n}) =>
      (_root.$meta.cardinalResolver ??
      PluralResolvers.cardinal('en'))(
        n,
        zero: 'You have not clicked on any time',
        one: 'You have clicked on \$ time',
        other: 'You have clicked on \$ times',
      );
}

// Path: modules.settings
class TranslationsModulesSettingsEn {
  TranslationsModulesSettingsEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Settings'
  String get title => 'Settings';

  late final TranslationsModulesSettingsLanguageSwitcherEn
  languageSwitcher =
      TranslationsModulesSettingsLanguageSwitcherEn._(_root);
  late final TranslationsModulesSettingsThemeSwitcherEn
  themeSwitcher = TranslationsModulesSettingsThemeSwitcherEn._(
    _root,
  );
}

// Path: modules.settings.languageSwitcher
class TranslationsModulesSettingsLanguageSwitcherEn {
  TranslationsModulesSettingsLanguageSwitcherEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Language'
  String get title => 'Language';

  /// en: 'Select the language you want to use'
  String get subtitle => 'Select the language you want to use';
}

// Path: modules.settings.themeSwitcher
class TranslationsModulesSettingsThemeSwitcherEn {
  TranslationsModulesSettingsThemeSwitcherEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Set the brightness of the app'
  String get title => 'Set the brightness of the app';

  late final TranslationsModulesSettingsThemeSwitcherSubtitleEn
  subtitle =
      TranslationsModulesSettingsThemeSwitcherSubtitleEn._(
        _root,
      );
}

// Path: modules.settings.themeSwitcher.subtitle
class TranslationsModulesSettingsThemeSwitcherSubtitleEn {
  TranslationsModulesSettingsThemeSwitcherSubtitleEn._(
    this._root,
  );

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Set to light mode'
  String get toLight => 'Set to light mode';

  /// en: 'Set to dark mode'
  String get toDark => 'Set to dark mode';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
  dynamic _flatMapFunction(String path) {
    switch (path) {
      case 'appName':
        return 'Awesome Flutter Template';
      case 'modules.home.title':
        return 'Home';
      case 'modules.home.FABTooltip':
        return 'Increment';
      case 'modules.home.counterTitle':
        return 'Counter';
      case 'modules.home.counter':
        return ({required num n}) =>
            (_root.$meta.cardinalResolver ??
            PluralResolvers.cardinal('en'))(
              n,
              zero: 'You have not clicked on any time',
              one: 'You have clicked on \$ time',
              other: 'You have clicked on \$ times',
            );
      case 'modules.settings.title':
        return 'Settings';
      case 'modules.settings.languageSwitcher.title':
        return 'Language';
      case 'modules.settings.languageSwitcher.subtitle':
        return 'Select the language you want to use';
      case 'modules.settings.themeSwitcher.title':
        return 'Set the brightness of the app';
      case 'modules.settings.themeSwitcher.subtitle.toLight':
        return 'Set to light mode';
      case 'modules.settings.themeSwitcher.subtitle.toDark':
        return 'Set to dark mode';
      default:
        return null;
    }
  }
}
