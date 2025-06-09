import 'package:flutter/material.dart';
import 'package:timberr/constants.dart';
import 'package:timberr/utils/font_style.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 48,
        decoration: BoxDecoration(
          color: kColorPrimary,
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.center,
        child: Text(text,
            style: HTextTheme.body16MediumDark.copyWith(color: Colors.white)),
      ),
    );
  }
}
