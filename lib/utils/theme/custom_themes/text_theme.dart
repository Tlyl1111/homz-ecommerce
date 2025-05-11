import 'package:flutter/material.dart';

class HTextTheme {
  HTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    // Titles
    headlineLarge: TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ), // title40Bold
    headlineMedium: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ), // title32SemiBold
    headlineSmall: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ), // title28Medium
    // Subtitles
    titleLarge: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ), // title28Regular
    titleMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ), // body24Bold
    titleSmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ), // body24Medium
    // Body
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ), // body16Regular
    bodyMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w300,
      color: Colors.black,
    ), // body16Light
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ), // body12Regular
    // Labels
    labelLarge: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ), // body12SemiBold
    labelMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w300,
      color: Colors.black,
    ), // body12Light
    labelSmall: TextStyle(
      fontSize: 8,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ), // body8Regular
  );

  static TextTheme darkTextTheme = TextTheme(
    // Titles
    headlineLarge: TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ), // title40Bold
    headlineMedium: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ), // title32SemiBold
    headlineSmall: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ), // title28Medium
    // Subtitles
    titleLarge: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ), // title28Regular
    titleMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ), // body24Bold
    titleSmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ), // body24Medium
    // Body
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ), // body16Regular
    bodyMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w300,
      color: Colors.white,
    ), // body16Light
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ), // body12Regular
    // Labels
    labelLarge: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ), // body12SemiBold
    labelMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w300,
      color: Colors.white,
    ), // body12Light
    labelSmall: TextStyle(
      fontSize: 8,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ), // body8Regular
  );
}

extension CustomTextStyles on TextTheme {
  // === Title 40 ===
  TextStyle get title40Bold => _custom(40, FontWeight.w700);
  TextStyle get title40SemiBold => _custom(40, FontWeight.w600);
  TextStyle get title40Medium => _custom(40, FontWeight.w500);
  TextStyle get title40Regular => _custom(40, FontWeight.w400);

  // === Title 32 ===
  TextStyle get title32Bold => _custom(32, FontWeight.w700);
  TextStyle get title32SemiBold => _custom(32, FontWeight.w600);
  TextStyle get title32Medium => _custom(32, FontWeight.w500);
  TextStyle get title32Regular => _custom(32, FontWeight.w400);

  // === Title 28 ===
  TextStyle get title28Bold => _custom(28, FontWeight.w700);
  TextStyle get title28SemiBold => _custom(28, FontWeight.w600);
  TextStyle get title28Medium => _custom(28, FontWeight.w500);
  TextStyle get title28Regular => _custom(28, FontWeight.w400);

  // === Body 24 ===
  TextStyle get body24Bold => _custom(24, FontWeight.w700);
  TextStyle get body24SemiBold => _custom(24, FontWeight.w600);
  TextStyle get body24Medium => _custom(24, FontWeight.w500);
  TextStyle get body24Regular => _custom(24, FontWeight.w400);
  TextStyle get body24Light => _custom(24, FontWeight.w300);

  // === Body 16 ===
  TextStyle get body16Bold => _custom(16, FontWeight.w700);
  TextStyle get body16SemiBold => _custom(16, FontWeight.w600);
  TextStyle get body16Medium => _custom(16, FontWeight.w500);
  TextStyle get body16Regular => _custom(16, FontWeight.w400);
  TextStyle get body16Light => _custom(16, FontWeight.w300);

  // === Body 12 ===
  TextStyle get body12Bold => _custom(12, FontWeight.w700);
  TextStyle get body12SemiBold => _custom(12, FontWeight.w600);
  TextStyle get body12Medium => _custom(12, FontWeight.w500);
  TextStyle get body12Regular => _custom(12, FontWeight.w400);
  TextStyle get body12Light => _custom(12, FontWeight.w300);

  // === Body 8 ===
  TextStyle get body8Bold => _custom(8, FontWeight.w700);
  TextStyle get body8SemiBold => _custom(8, FontWeight.w600);
  TextStyle get body8Medium => _custom(8, FontWeight.w500);
  TextStyle get body8Regular => _custom(8, FontWeight.w400);
  TextStyle get body8Light => _custom(8, FontWeight.w300);

  // === Hàm dùng chung ===
  TextStyle _custom(double size, FontWeight weight) => TextStyle(
    fontFamily: 'Poppins',
    fontSize: size,
    fontWeight: weight,
    color: Colors.black,
  );
}
