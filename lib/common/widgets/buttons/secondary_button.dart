import 'package:flutter/material.dart';
import 'package:timberr/constants.dart';
import 'package:timberr/utils/font_style.dart';

class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final String? imagePath;

  const SecondaryButton({
    super.key,
    required this.text,
    required this.onTap,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 48,
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 17),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: kColorPrimary, width: 1),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (imagePath != null) ...[
              Image.asset(
                imagePath!,
                width: 20,
                height: 20,
              ),
              const SizedBox(width: 8),
            ],
            Text(text, style: HTextTheme.body12MediumDark),
          ],
        ),
      ),
    );
  }
}
