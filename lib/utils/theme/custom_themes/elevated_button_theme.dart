import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:flutter_application_1/utils/theme/custom_themes/text_theme.dart';

class HElevatedButtonTheme {
  HElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: HColors.white,
      backgroundColor: HColors.green500,
      disabledForegroundColor: HColors.white,
      disabledBackgroundColor: HColors.green100,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      textStyle: HTextTheme.lightTextTheme.body16Medium,
      shape: const StadiumBorder(),
    ),
  );
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: HColors.white,
      backgroundColor: HColors.green500,
      disabledForegroundColor: HColors.white,
      disabledBackgroundColor: HColors.green100,
      padding: const EdgeInsets.symmetric(vertical: 8),
      textStyle: HTextTheme.lightTextTheme.body16Medium,
      shape: const StadiumBorder(),
    ),
  );
}
