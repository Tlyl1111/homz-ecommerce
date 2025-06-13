import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.suffixIcon,
    this.enabled = true,
    this.onChanged,
    this.minLines,
    this.maxLines,
  });

  final String hintText;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final bool? enabled;
  final Function(String)? onChanged;
  final int? minLines;
  final int? maxLines;

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
      onChanged: onChanged,
      minLines: minLines,
      maxLines: maxLines,
    );
  }
}
