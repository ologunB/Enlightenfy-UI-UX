import 'package:flutter/material.dart';

class RegisterInputField extends StatelessWidget {
  const RegisterInputField(
      {@required this.validator,
      @required this.hint,
      this.controller,
      this.obscureText,
      this.suffixIcon,
      this.prefixIcon, this.textInputType});

  final Function(String) validator;
  final String hint;
  final TextInputType textInputType;
  final TextEditingController controller;
  final bool obscureText;
  final Icon suffixIcon;
  final Icon prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      style: const TextStyle(color: Colors.white),
      controller: controller,
      keyboardType: textInputType ?? TextInputType.text,
      decoration: InputDecoration(
        hintText: hint,
        icon: prefixIcon,
        labelStyle: const TextStyle(color: Colors.white),
        disabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white)),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white)),
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white)),
        focusedErrorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white)),
        errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white)),
      ),
      validator: validator,
    );
  }
}
