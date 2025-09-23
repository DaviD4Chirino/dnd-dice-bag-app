///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsEs implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsEs({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.es,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <es>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsEs _root = this; // ignore: unused_field

	@override 
	TranslationsEs $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsEs(meta: meta ?? this.$meta);

	// Translations
	@override String get appName => 'Dados & Dados';
	@override late final _TranslationsModulesEs modules = _TranslationsModulesEs._(_root);
	@override late final _TranslationsUtilsEs utils = _TranslationsUtilsEs._(_root);
}

// Path: modules
class _TranslationsModulesEs implements TranslationsModulesEn {
	_TranslationsModulesEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsModulesHomeEs home = _TranslationsModulesHomeEs._(_root);
	@override late final _TranslationsModulesRollResultDialogEs rollResultDialog = _TranslationsModulesRollResultDialogEs._(_root);
	@override late final _TranslationsModulesSettingsEs settings = _TranslationsModulesSettingsEs._(_root);
}

// Path: utils
class _TranslationsUtilsEs implements TranslationsUtilsEn {
	_TranslationsUtilsEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsUtilsCopyToClipboardEs copyToClipboard = _TranslationsUtilsCopyToClipboardEs._(_root);
	@override late final _TranslationsUtilsShareEs share = _TranslationsUtilsShareEs._(_root);
}

// Path: modules.home
class _TranslationsModulesHomeEs implements TranslationsModulesHomeEn {
	_TranslationsModulesHomeEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Inicio';
	@override String get FABTooltip => 'Aumentar';
	@override String get counterTitle => 'Contador';
	@override String counter({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(n,
		zero: 'No has hecho clic',
		one: 'Has hecho clic ${n} vez',
		other: 'Has hecho clic ${n} veces',
	);
	@override late final _TranslationsModulesHomeTabsEs tabs = _TranslationsModulesHomeTabsEs._(_root);
	@override late final _TranslationsModulesHomePagesEs pages = _TranslationsModulesHomePagesEs._(_root);
}

// Path: modules.rollResultDialog
class _TranslationsModulesRollResultDialogEs implements TranslationsModulesRollResultDialogEn {
	_TranslationsModulesRollResultDialogEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get reroll => 'Volver a tirar';
}

// Path: modules.settings
class _TranslationsModulesSettingsEs implements TranslationsModulesSettingsEn {
	_TranslationsModulesSettingsEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Configuración';
	@override late final _TranslationsModulesSettingsLanguageSwitcherEs languageSwitcher = _TranslationsModulesSettingsLanguageSwitcherEs._(_root);
	@override late final _TranslationsModulesSettingsThemeSwitcherEs themeSwitcher = _TranslationsModulesSettingsThemeSwitcherEs._(_root);
}

// Path: utils.copyToClipboard
class _TranslationsUtilsCopyToClipboardEs implements TranslationsUtilsCopyToClipboardEn {
	_TranslationsUtilsCopyToClipboardEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get success => 'Copiado al portapapeles';
	@override String get buttonLabel => 'Copiar al portapapeles';
	@override String get buttonLabelShort => 'Copiar';
}

// Path: utils.share
class _TranslationsUtilsShareEs implements TranslationsUtilsShareEn {
	_TranslationsUtilsShareEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get success => 'Compartido con éxito';
	@override String get buttonLabel => 'Compartir';
	@override String get buttonLabelShort => 'Compartir';
}

// Path: modules.home.tabs
class _TranslationsModulesHomeTabsEs implements TranslationsModulesHomeTabsEn {
	_TranslationsModulesHomeTabsEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get dice => 'Dados';
	@override String get history => 'Historial';
}

// Path: modules.home.pages
class _TranslationsModulesHomePagesEs implements TranslationsModulesHomePagesEn {
	_TranslationsModulesHomePagesEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsModulesHomePagesDiceRollPageEs diceRollPage = _TranslationsModulesHomePagesDiceRollPageEs._(_root);
}

// Path: modules.settings.languageSwitcher
class _TranslationsModulesSettingsLanguageSwitcherEs implements TranslationsModulesSettingsLanguageSwitcherEn {
	_TranslationsModulesSettingsLanguageSwitcherEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Idioma';
	@override String get subtitle => 'Cambiar el idioma';
}

// Path: modules.settings.themeSwitcher
class _TranslationsModulesSettingsThemeSwitcherEs implements TranslationsModulesSettingsThemeSwitcherEn {
	_TranslationsModulesSettingsThemeSwitcherEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Cambiar el brillo de la aplicación';
	@override late final _TranslationsModulesSettingsThemeSwitcherSubtitleEs subtitle = _TranslationsModulesSettingsThemeSwitcherSubtitleEs._(_root);
}

// Path: modules.home.pages.diceRollPage
class _TranslationsModulesHomePagesDiceRollPageEs implements TranslationsModulesHomePagesDiceRollPageEn {
	_TranslationsModulesHomePagesDiceRollPageEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get info => 'Toca el dado para comenzar!';
}

// Path: modules.settings.themeSwitcher.subtitle
class _TranslationsModulesSettingsThemeSwitcherSubtitleEs implements TranslationsModulesSettingsThemeSwitcherSubtitleEn {
	_TranslationsModulesSettingsThemeSwitcherSubtitleEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get toLight => 'Cambiar a tema claro';
	@override String get toDark => 'Cambiar a tema oscuro';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsEs {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'appName': return 'Dados & Dados';
			case 'modules.home.title': return 'Inicio';
			case 'modules.home.FABTooltip': return 'Aumentar';
			case 'modules.home.counterTitle': return 'Contador';
			case 'modules.home.counter': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(n,
				zero: 'No has hecho clic',
				one: 'Has hecho clic ${n} vez',
				other: 'Has hecho clic ${n} veces',
			);
			case 'modules.home.tabs.dice': return 'Dados';
			case 'modules.home.tabs.history': return 'Historial';
			case 'modules.home.pages.diceRollPage.info': return 'Toca el dado para comenzar!';
			case 'modules.rollResultDialog.reroll': return 'Volver a tirar';
			case 'modules.settings.title': return 'Configuración';
			case 'modules.settings.languageSwitcher.title': return 'Idioma';
			case 'modules.settings.languageSwitcher.subtitle': return 'Cambiar el idioma';
			case 'modules.settings.themeSwitcher.title': return 'Cambiar el brillo de la aplicación';
			case 'modules.settings.themeSwitcher.subtitle.toLight': return 'Cambiar a tema claro';
			case 'modules.settings.themeSwitcher.subtitle.toDark': return 'Cambiar a tema oscuro';
			case 'utils.copyToClipboard.success': return 'Copiado al portapapeles';
			case 'utils.copyToClipboard.buttonLabel': return 'Copiar al portapapeles';
			case 'utils.copyToClipboard.buttonLabelShort': return 'Copiar';
			case 'utils.share.success': return 'Compartido con éxito';
			case 'utils.share.buttonLabel': return 'Compartir';
			case 'utils.share.buttonLabelShort': return 'Compartir';
			default: return null;
		}
	}
}

