import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color blue = const Color.fromRGBO(72, 178, 231, 1);
Color lightGrey = const Color.fromRGBO(247, 247, 249, 1);
Color grey = const Color.fromRGBO(112, 123, 129, 1);
Color darkGrey = const Color.fromRGBO(106, 106, 106, 1);
Color black =  const Color.fromRGBO(43, 43, 43, 1);

extension MyColorScheme on ColorScheme {
  Color get blue => const Color.fromRGBO(72, 178, 231, 1);
  Color get lightGrey => const Color.fromRGBO(247, 247, 249, 1);
  Color get grey => const Color.fromRGBO(112, 123, 129, 1);
  Color get darkGrey => const Color.fromRGBO(106, 106, 106, 1);
  Color get black => const Color.fromRGBO(43, 43, 43, 1);
}

var defaultTheme = ThemeData(
  textTheme: TextTheme(
    displayMedium: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: black,
    ),
    titleLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: grey,
      height: 24/16
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: black,
      height: 20/16
    ),
    bodyMedium: TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      height: 16/14,
      color: darkGrey,
    ),
    labelLarge: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      height: 22/14,
      color: Colors.white,
    ),
    labelMedium: TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontSize: 12,
      fontWeight: FontWeight.normal,
      height: 16/12,
      color: darkGrey,
    )
  ),
  fontFamily: GoogleFonts.raleway().fontFamily,
  colorScheme: ColorScheme.fromSeed(
    seedColor: blue,
    onPrimary: lightGrey,
    surface: Colors.white,
  ),
  iconButtonTheme: IconButtonThemeData(
    style: TextButton.styleFrom(
      backgroundColor: lightGrey,
    ),
  ),
  useMaterial3: true,
);
