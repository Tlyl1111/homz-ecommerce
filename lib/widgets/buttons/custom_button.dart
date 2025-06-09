import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;
  final double? height;
  const CustomButton({
    super.key,
    required this.onTap,
    required this.child,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF325052),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(27),
        ),
        maximumSize: Size.fromHeight(height ?? 32),
        minimumSize: Size.fromHeight(height ?? 32),
      ),
      onPressed: onTap,
      child: child,
    );
  }
}
