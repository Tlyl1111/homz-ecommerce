import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:flutter_application_1/utils/theme/custom_themes/text_theme.dart';

class HChipTheme {
  HChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: Colors.grey.withOpacity(0.4),
    labelStyle: HTextTheme.lightTextTheme.body12Regular,
    selectedColor: HColors.green500,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    checkmarkColor: HColors.white,
    shape: StadiumBorder(),
  );

  static ChipThemeData darkChipTheme = ChipThemeData(
    disabledColor: Colors.grey.withOpacity(0.4),
    labelStyle: HTextTheme.lightTextTheme.body12Regular,
    selectedColor: HColors.green500,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    checkmarkColor: HColors.white,
    shape: StadiumBorder(),
  );
}
