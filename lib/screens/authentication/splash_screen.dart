import 'package:flutter/material.dart';
import 'package:timberr/constants.dart';
import 'package:timberr/utils/font_style.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorPrimary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/app_logo.png",
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 20),
            Text(
              "Homz",
              style:
                  HTextTheme.title32SemiBoldDark.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
