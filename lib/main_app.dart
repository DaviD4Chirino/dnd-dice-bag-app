import 'package:awesome_flutter_template/i18n/gen/strings.g.dart';
import 'package:awesome_flutter_template/providers/theme_mode_provider.dart';
import 'package:awesome_flutter_template/tokens/app/app_routes.dart';
import 'package:awesome_flutter_template/tokens/app/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:layout/layout.dart';

class MainApp extends ConsumerStatefulWidget {
  const MainApp({super.key});

  @override
  ConsumerState<MainApp> createState() => _MainAppState();
}

class _MainAppState extends ConsumerState<MainApp> {
  // Locale get locale => ref.watch(translationNotifierProvider);
  ThemeMode get themeModeProvider =>
      ref.watch(themeModeNotifierProvider);

  @override
  Widget build(BuildContext context) {
    /* var localizationDelegate = LocalizedApp.of(context).delegate; */

    return Layout(
      child: MaterialApp(
        title: "Awesome Flutter Template",
        debugShowCheckedModeBanner: false,

        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: themeModeProvider,

        initialRoute: AppRoutes.initial,
        routes: AppRoutes.routes,

        locale: TranslationProvider.of(
          context,
        ).flutterLocale, // use provider
        supportedLocales: AppLocaleUtils.supportedLocales,
        localizationsDelegates: [
          ...GlobalMaterialLocalizations.delegates,
          LocaleNamesLocalizationsDelegate(),
        ],

        // localizationsDelegates: [
        //   GlobalMaterialLocalizations.delegate,
        //   GlobalWidgetsLocalizations.delegate,
        //   GlobalMaterialLocalizations.delegate,
        //   GlobalCupertinoLocalizations.delegate,
        //   localizationDelegate,
        // ],
        // supportedLocales:
        //     localizationDelegate.supportedLocales,
        // locale: localizationDelegate.currentLocale,
      ),
    );
  }
}
