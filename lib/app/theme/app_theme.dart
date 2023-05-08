import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_download_youtube/app/theme/app_colors.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
      dialogBackgroundColor: greyBgLightColor,
      scaffoldBackgroundColor: scaffoldLightColor,
      primaryColor: primaryColor,
      iconTheme: const IconThemeData(color: primaryColor),
      appBarTheme: const AppBarTheme(backgroundColor: scaffoldLightColor),
      snackBarTheme: const SnackBarThemeData(
          backgroundColor: primaryColor, actionTextColor: whiteColor),
      dividerColor: viewLineLightColor,
      progressIndicatorTheme:
          const ProgressIndicatorThemeData(color: Color(0xFF1F2633)),
      colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: primaryColor,
          onPrimary: primaryColor,
          secondary: secondaryColor,
          onSecondary: textPrimaryColorLightTheme,
          error: Colors.red,
          onError: Colors.redAccent,
          background: greyBgLightColor,
          onBackground: scaffoldLightColor,
          surface: btnLightColor,
          onSurface: primaryColor,
          onTertiary: btnDarkColor,
          primaryVariant: Color(0xFF1F2633),
          secondaryVariant: Colors.white),
      // checkboxTheme: CheckboxThemeData(
      //   shape: RoundedRectangleBorder(
      //       borderRadius: radius(20), side: const BorderSide(width: 1)),
      //   checkColor: MaterialStateProperty.all(Colors.white),
      //   fillColor: MaterialStateProperty.all(primaryColor),
      //   materialTapTargetSize: MaterialTapTargetSize.padded,
      // ),
      textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme).apply(
        bodyColor: textPrimaryColorLightTheme,
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
          TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ));
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    dialogBackgroundColor: greyBgDarkColor,
    scaffoldBackgroundColor: scaffoldDarkColor,
    iconTheme: const IconThemeData(color: Colors.white),
    snackBarTheme: const SnackBarThemeData(
        backgroundColor: whiteColor, actionTextColor: primaryColor),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: Color(0xFFF6F1F1)),
    colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: primaryDarkColor,
        onPrimary: primaryColor,
        secondary: secondaryColor,
        onSecondary: textPrimaryColorDarkTheme,
        error: Colors.red,
        onError: Colors.redAccent,
        background: greyBgDarkColor,
        onBackground: scaffoldDarkColor,
        surface: btnDarkColor,
        onSurface: whiteColor,
        onTertiary: whiteColor,
        primaryVariant: Color(0xFFF5EBEB),
        secondaryVariant: Colors.black),
    appBarTheme: const AppBarTheme(backgroundColor: scaffoldDarkColor),
    dividerColor: viewLineDarkColor,
    textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme).apply(
      bodyColor: textPrimaryColorDarkTheme,
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
        TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
  );
}
