import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color _lightBlue = const Color.fromRGBO(223, 239, 255, 1);
Color _blue = const Color.fromRGBO(72, 178, 231, 1);
Color _darkBlue = const Color.fromRGBO(13, 110, 253, 1);
Color _lightGrey = const Color.fromRGBO(247, 247, 249, 1);
Color _grey = const Color.fromRGBO(112, 123, 129, 1);
Color _darkGrey = const Color.fromRGBO(106, 106, 106, 1);
Color _black = const Color.fromRGBO(43, 43, 43, 1);
Color _red = const Color.fromRGBO(248, 114, 101, 1);

extension MyColorScheme on ColorScheme {
  Color get lightBlue => _lightBlue;
  Color get blue => _blue;
  Color get darkBlue => _darkBlue;
  Color get lightGrey => _lightGrey;
  Color get grey => _grey;
  Color get darkGrey => _darkGrey;
  Color get black => _black;
  Color get red => _red;
}

var defaultTheme = ThemeData(
  textTheme: TextTheme(
      displayMedium: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: _black,
      ),
      headlineLarge: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        color: _black,
      ),
      headlineMedium: TextStyle(
        fontSize: 21,
        fontWeight: FontWeight.w600,
        color: _black,
      ),
      headlineSmall: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      titleLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: _grey,
          height: 24 / 16),
      titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: _black,
          height: 20 / 16),
      titleSmall: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: _black,
          height: 20 / 16),
      bodyLarge: TextStyle(
        fontFamily: GoogleFonts.poppins().fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.normal,
        height: 20 / 16,
        color: _grey,
      ),
      bodyMedium: TextStyle(
        fontFamily: GoogleFonts.poppins().fontFamily,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        height: 24 / 18,
        color: _black,
      ),
      bodySmall: TextStyle(
        fontFamily: GoogleFonts.poppins().fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 16 / 14,
        color: _darkGrey,
      ),
      labelLarge: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        height: 22 / 14,
        color: Colors.white,
      ),
      labelMedium: TextStyle(
        fontFamily: GoogleFonts.poppins().fontFamily,
        fontSize: 12,
        fontWeight: FontWeight.normal,
        height: 16 / 12,
        color: _darkGrey,
      ),
      labelSmall: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: Color.fromRGBO(125, 132, 141, 1),
      )),
  fontFamily: GoogleFonts.raleway().fontFamily,
  colorScheme: ColorScheme.fromSeed(
      seedColor: _blue,
      onPrimary: Colors.white,
      //surface: Colors.white,
      surface: _lightGrey),
  iconButtonTheme: IconButtonThemeData(
    style: TextButton.styleFrom(
      backgroundColor: _lightGrey,
    ),
  ),
  useMaterial3: true,
);
