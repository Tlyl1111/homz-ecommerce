import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.height,
  });

  final VoidCallback onPressed;
  final Widget child;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: const BorderSide(
          color: Color(0xFF325052),
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(27),
        ),
        maximumSize: Size.fromHeight(height ?? 32),
        minimumSize: Size.fromHeight(height ?? 32),
      ),
      child: child,
    );
  }
}
