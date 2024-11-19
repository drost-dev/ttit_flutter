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
    headlineMedium: TextStyle(
      fontSize: 21,
      fontWeight: FontWeight.w600,
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
    titleSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: black,
      height: 20/16
    ),
    bodyLarge: TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.normal,
      height: 20/16,
      color: grey,
    ),
    bodyMedium: TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontSize: 18,
      fontWeight: FontWeight.w600,
      height: 24/18,
      color: black,
    ),
    bodySmall: TextStyle(
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
    ),
    labelSmall: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Color.fromRGBO(125, 132, 141, 1),
    )
  ),
  fontFamily: GoogleFonts.raleway().fontFamily,
  colorScheme: ColorScheme.fromSeed(
    seedColor: blue,
    onPrimary: Colors.white,
    //surface: Colors.white,
    surface: lightGrey
  ),
  iconButtonTheme: IconButtonThemeData(
    style: TextButton.styleFrom(
      backgroundColor: lightGrey,
    ),
  ),
  useMaterial3: true,
);
