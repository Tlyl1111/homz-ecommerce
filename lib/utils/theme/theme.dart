import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:flutter_application_1/utils/theme/custom_themes/text_theme.dart';

import 'custom_themes/elevated_button_theme.dart';
class HAppTheme {
  HAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue, //will be in contants
    scaffoldBackgroundColor: Colors.white,
    textTheme: HTextTheme.lightTextTheme,
    elevatedButtonTheme: HElevatedButtonTheme.lightElevatedButtonTheme,


  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue, //will be in contants
    scaffoldBackgroundColor: Colors.black,
    textTheme: HTextTheme.darkTextTheme,
    elevatedButtonTheme: HElevatedButtonTheme.darkElevatedButtonTheme,

  );

}
