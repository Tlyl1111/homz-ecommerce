import 'package:flutter/material.dart';
import 'package:flutter_application_1/navigation_menu.dart';
import 'package:flutter_application_1/utils/theme/custom_themes/text_theme.dart';
import 'package:flutter_application_1/utils/theme/theme.dart';

class ThemePreviewScreen extends StatefulWidget {
  const ThemePreviewScreen({super.key});

  @override
  State<ThemePreviewScreen> createState() => _ThemePreviewScreenState();
}

class _ThemePreviewScreenState extends State<ThemePreviewScreen> {
  bool isChecked = false;
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: HAppTheme.lightTheme,
      darkTheme: HAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: NavigationMenu(),
    );
  }
}
