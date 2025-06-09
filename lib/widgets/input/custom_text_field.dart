import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.suffixIcon,
    this.enabled = true,
  });

  final String hintText;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final bool? enabled;

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: enabled,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        fillColor: const Color(0xFFEEEEEE),
        hintStyle: const TextStyle(
            color: Colors.black, fontFamily: 'Poppins', fontSize: 16),
        filled: true,
        suffixIcon: suffixIcon,
        hintText: hintText,
      ),
    );
  }
}
