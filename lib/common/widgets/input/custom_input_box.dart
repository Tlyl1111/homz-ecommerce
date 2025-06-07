import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:timberr/constants.dart';
import 'package:timberr/utils/font_style.dart';

class CustomInputBox extends StatefulWidget {
  final String headerText;
  final String hintText;
  final Function(String val) onChanged;
  final String? Function(String? val)? validator;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final String? initialValue;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;
  final Widget? suffixIcon;

  const CustomInputBox({
    super.key,
    required this.headerText,
    required this.hintText,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.number,
    required this.onChanged,
    this.initialValue,
    this.validator,
    this.maxLength,
    this.inputFormatters,
    this.obscureText = false,
    this.suffixIcon,
  });

  @override
  State<CustomInputBox> createState() => _CustomInputBoxState();
}

class _CustomInputBoxState extends State<CustomInputBox> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController(text: widget.initialValue);
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8), // Padding from CSS
      decoration: BoxDecoration(
        color: const Color(0xFFEEEEEE), // Background color from CSS
        borderRadius: BorderRadius.circular(12), // Border radius from CSS
      ),
      child: TextFormField(
        controller: _textEditingController,
        onChanged: widget.onChanged,
        validator: widget.validator,
        obscureText: widget.obscureText,
        maxLength: widget.maxLength,
        keyboardType: widget.textInputType,
        textInputAction: widget.textInputAction,
        inputFormatters: widget.inputFormatters,
        cursorColor: kOffBlack,
        decoration: InputDecoration(
          labelText: widget.headerText,
          labelStyle: HTextTheme.body16LightLight.copyWith(color: Colors.grey),
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          counterText: "", // Hide character counter
          border: InputBorder.none, // No border on the TextFormField itself
          contentPadding: EdgeInsets.zero, // Adjust padding via Container
          suffixIcon: widget.suffixIcon,
        ),
      ),
    );
  }
}

class CreditCardFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String actualText = newValue.text.replaceAll(" ", "");
    String newText = "";
    for (int i = 0; i < actualText.length; i++) {
      if (i % 4 == 0 && i != 0) {
        newText += ' ';
      }
      newText += actualText[i];
    }

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}

class DateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String actualText = newValue.text.replaceAll("/", "");
    String newText = "";
    for (int i = 0; i < actualText.length; i++) {
      if (i == 2) {
        newText += '/';
      }
      newText += actualText[i];
    }

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
