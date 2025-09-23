import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// The [AppTheme] defines light and dark themes for the app.
///
/// Theme setup for FlexColorScheme package v8.
/// Use same major flex_color_scheme package version. If you use a
/// lower minor version, some properties may not be supported.
/// In that case, remove them after copying this theme to your
/// app or upgrade the package to version 8.2.0.
///
/// Use it in a [MaterialApp] like this:
///
/// MaterialApp(
///   theme: AppTheme.light,
///   darkTheme: AppTheme.dark,
/// );
abstract final class AppTheme {
  static TextTheme appTextTheme =
      GoogleFonts.notoSansTextTheme();
  // The FlexColorScheme defined light mode ThemeData.
  static ThemeData light = FlexThemeData.light(
    textTheme: appTextTheme,
    // User defined custom colors made with FlexSchemeColor() API.
    colors: const FlexSchemeColor(
      tertiary: Color(0xFFD50000),
      tertiaryContainer: Color(0xFFFF9E7B),
      secondary: Color(0xFFFFCD00),
      secondaryContainer: Color(0xFFFFE166),
      primary: Color(0xFF536DFE),
      primaryContainer: Color(0xFF18FFFF),
      appBarColor: Color(0xFFFFE166),
      error: Color(0xFFBA1A1A),
      errorContainer: Color(0xFFFFDAD6),
    ),
    // Input color modifiers.
    useMaterial3ErrorColors: true,
    // Component theme configurations for light mode.
    subThemesData: const FlexSubThemesData(
      interactionEffects: true,
      tintedDisabledControls: true,
      scaffoldBackgroundBaseColor:
          FlexScaffoldBaseColor.surfaceContainerLow,
      useMaterial3Typography: true,
      useM2StyleDividerInM3: true,
      defaultRadius: 20.0,
      textButtonRadius: 40.0,
      textButtonSchemeColor: SchemeColor.secondary,
      filledButtonRadius: 40.0,
      filledButtonSchemeColor: SchemeColor.secondary,
      elevatedButtonRadius: 40.0,
      elevatedButtonSchemeColor: SchemeColor.secondary,
      outlinedButtonRadius: 40.0,
      outlinedButtonSchemeColor: SchemeColor.secondary,
      outlinedButtonOutlineSchemeColor: SchemeColor.secondary,
      segmentedButtonRadius: 40.0,
      chipSchemeColor: SchemeColor.secondary,
      alignedDropdown: true,
      tooltipRadius: 4,
      appBarBackgroundSchemeColor:
          SchemeColor.surfaceContainerLow,
      navigationRailUseIndicator: true,
    ),
    // Direct ThemeData properties.
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    cupertinoOverrideTheme: const CupertinoThemeData(
      applyThemeToAll: true,
    ),
  );

  // The FlexColorScheme defined dark mode ThemeData.
  static ThemeData dark = FlexThemeData.dark(
    textTheme: appTextTheme,
    // User defined custom colors made with FlexSchemeColor() API.
    colors: const FlexSchemeColor(
      tertiary: Color(0xFFEA1D11),
      tertiaryContainer: Color(0xFFD32F2F),
      tertiaryLightRef: Color(
        0xFFD50000,
      ), // The color of light mode primary
      secondary: Color(0xFFEEFF41),
      secondaryContainer: Color(0xFFFBC02D),
      secondaryLightRef: Color(
        0xFFFFCD00,
      ), // The color of light mode secondary
      primary: Color(0xFF2196F3),
      primaryContainer: Color(0xFF00BCD4),
      primaryLightRef: Color(
        0xFF536DFE,
      ), // The color of light mode tertiary
      appBarColor: Color(0xFFFFE166),
      error: Color(0xFFFFB4AB),
      errorContainer: Color(0xFF93000A),
    ),
    // Input color modifiers.
    useMaterial3ErrorColors: true,
    // Component theme configurations for dark mode.
    subThemesData: const FlexSubThemesData(
      interactionEffects: true,
      tintedDisabledControls: true,
      scaffoldBackgroundBaseColor:
          FlexScaffoldBaseColor.surfaceContainerLow,
      useMaterial3Typography: true,
      useM2StyleDividerInM3: true,
      defaultRadius: 20.0,
      textButtonRadius: 40.0,
      textButtonSchemeColor: SchemeColor.secondary,
      filledButtonRadius: 40.0,
      filledButtonSchemeColor: SchemeColor.secondary,
      elevatedButtonRadius: 40.0,
      elevatedButtonSchemeColor: SchemeColor.secondary,
      outlinedButtonRadius: 40.0,
      outlinedButtonSchemeColor: SchemeColor.secondary,
      outlinedButtonOutlineSchemeColor: SchemeColor.secondary,
      segmentedButtonRadius: 40.0,
      chipSchemeColor: SchemeColor.secondary,
      alignedDropdown: true,
      tooltipRadius: 4,
      appBarBackgroundSchemeColor:
          SchemeColor.surfaceContainerLow,
      navigationRailUseIndicator: true,
    ),
    // Direct ThemeData properties.
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    cupertinoOverrideTheme: const CupertinoThemeData(
      applyThemeToAll: true,
    ),
  );
}
