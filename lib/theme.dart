import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:analog_clock/my_colors.dart';

// Light (default) theme
ThemeData themeData(BuildContext context) {
  return ThemeData(
    appBarTheme: appBarTheme,
    primaryColor: MyColors.primaryColor,
    accentColor: MyColors.accentLightColor,
    scaffoldBackgroundColor: MyColors.scaffoldBackgroundLightColor,
    colorScheme: ColorScheme.light(
      secondary: MyColors.secondaryLightColor,
      surface: MyColors.surfaceLightColor,
    ),
    backgroundColor: MyColors.backgroundLightColor,
    iconTheme: IconThemeData(color: MyColors.bodyTextLightColor),
    primaryIconTheme: IconThemeData(color: MyColors.primaryIconLightColor),
    accentIconTheme: IconThemeData(color: MyColors.accentIconLightColor),
    textTheme: GoogleFonts.latoTextTheme().copyWith(
      bodyText1: TextStyle(color: MyColors.bodyTextLightColor),
      bodyText2: TextStyle(color: MyColors.bodyTextLightColor),
      headline4: TextStyle(color: MyColors.titleTextLightColor, fontSize: 32),
      headline1: TextStyle(
        color: MyColors.titleTextLightColor,
        fontWeight: FontWeight.w300,
        fontSize: 80,
      ),
    ),
  );
}

// Dark theme
ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    appBarTheme: appBarTheme,
    primaryColor: MyColors.primaryColor,
    accentColor: MyColors.accentDarkColor,
    scaffoldBackgroundColor: MyColors.scaffoldBackgroundDarkColor,
    colorScheme: ColorScheme.dark(
      secondary: MyColors.secondaryDarkColor,
      surface: MyColors.surfaceDarkColor,
    ),
    backgroundColor: MyColors.backgroundDarkColor,
    iconTheme: IconThemeData(color: MyColors.bodyTextDarkColor),
    primaryIconTheme: IconThemeData(color: MyColors.primaryIconDarkColor),
    accentIconTheme: IconThemeData(color: MyColors.accentIconDarkColor),
    textTheme: GoogleFonts.latoTextTheme().copyWith(
      bodyText1: TextStyle(color: MyColors.bodyTextDarkColor),
      bodyText2: TextStyle(color: MyColors.bodyTextDarkColor),
      headline4: TextStyle(color: MyColors.titleTextDarkColor, fontSize: 32),
      headline1: TextStyle(
        color: MyColors.titleTextDarkColor,
        fontWeight: FontWeight.w300,
        fontSize: 80,
      ),
    ),
  );
}

AppBarTheme appBarTheme = AppBarTheme(color: Colors.transparent, elevation: 0);
