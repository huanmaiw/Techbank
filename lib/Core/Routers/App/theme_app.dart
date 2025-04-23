import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:huanmaiw/Core/Space/Color/res_color.dart';
import 'package:huanmaiw/Core/Space/radius.dart';
import 'package:huanmaiw/Core/Space/res_typo.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: ResColor.backgroundColor,
    fontFamily: GoogleFonts.inter().fontFamily,
    splashFactory: NoSplash.splashFactory,
    highlightColor: Colors.transparent,
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.white,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(ResRadius.r10),
          topRight: Radius.circular(ResRadius.r10),
        ),
      ),
    ),
    colorScheme: const ColorScheme.light().copyWith(
      primary: ResColor.primaryColor,
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(ResRadius.r10),
        ),
      ),
      titleTextStyle: TextStyle(
        fontWeight: ResTypography.semiBold,
        fontSize: ResTypography.h7,
        color: Colors.white,
      ),
    ),
    cardTheme: const CardTheme(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(ResRadius.r10),
        ),
      ),
    ),
    appBarTheme: const AppBarTheme(
      // backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
    ),
    iconButtonTheme: const IconButtonThemeData(
      style: ButtonStyle(
        iconColor: WidgetStatePropertyAll<Color>(Colors.black),
      ),
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Color(0xFFF9FAFB),
    ),
  );
}
