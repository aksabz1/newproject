import 'package:flutter/material.dart';
import 'package:salons/core/utils/color_manager.dart';
import 'package:salons/core/utils/styles_manager.dart';

class AppTheme {
  AppTheme._();
  static final ThemeData lightTheme = ThemeData(
    fontFamily: 'Vazir',
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      background: Color(0xffffffff),
      primary: Color(0xff783dc2),
      surfaceTint: Color(0xff783dc2),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffbc89ff),
      onPrimaryContainer: Color(0xff220047),
      secondary: Color(0xff6b5489),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffe1c8ff),
      onSecondaryContainer: Color(0xff493366),
      tertiary: Color(0xffa62d73),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xfffa71b9),
      onTertiaryContainer: Color(0xff32001e),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      onBackground: Color(0xff1e1a22),
      surface: Color(0xfffff7ff),
      onSurface: Color(0xff1e1a22),
      surfaceVariant: Color(0xffeadef1),
      onSurfaceVariant: Color(0xff4b4453),
      outline: Color(0xff7c7484),
      outlineVariant: Color(0xffcdc3d5),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff332f37),
      inversePrimary: Color(0xffd8b9ff),
    ),

    //?app bar theme

    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xffffffff),
    ),

    //? input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(8),
      // hint style
      hintStyle: getRegularStyle(color: ColorManager.darkGrey),

      // label style
      labelStyle: getMediumStyle(color: ColorManager.darkGrey),
      // error style
      errorStyle: getRegularStyle(color: ColorManager.error),

      // enabled border
      enabledBorder: const OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.darkGrey, width: 1.5),
          borderRadius: BorderRadius.all(Radius.circular(8))),

      // focused border
      focusedBorder: const OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.primary, width: 1.5),
          borderRadius: BorderRadius.all(Radius.circular(8))),

      // error border
      errorBorder: const OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.error, width:1.5),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      // focused error border
      focusedErrorBorder: const OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.primary, width: 1.5),
          borderRadius: BorderRadius.all(Radius.circular(8))),
    ),

    //? elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorManager.perpel,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        foregroundColor: Colors.white,
      ),
    ),

    //? text theme
    textTheme: const TextTheme(
      bodySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      displayMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Color.fromRGBO(151, 71, 255, 0.73),
      ),
    ),
    splashColor: Colors.transparent,
  );
  static final ThemeData darkTheme = ThemeData(
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffd8b9ff),
      surfaceTint: Color(0xffd8b9ff),
      onPrimary: Color(0xff450086),
      primaryContainer: Color(0xff9056da),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xffd7bbf8),
      onSecondary: Color(0xff3b2657),
      secondaryContainer: Color(0xff493366),
      onSecondaryContainer: Color(0xffe1c7ff),
      tertiary: Color(0xffffafd3),
      onTertiary: Color(0xff620040),
      tertiaryContainer: Color(0xffc3448a),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      background: Color(0xff15121a),
      onBackground: Color(0xffe8e0eb),
      surface: Color(0xff15121a),
      onSurface: Color(0xffe8e0eb),
      surfaceVariant: Color(0xff4b4453),
      onSurfaceVariant: Color(0xffcdc3d5),
      outline: Color(0xff978d9e),
      outlineVariant: Color(0xff4b4453),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe8e0eb),
    ),
  );
}
