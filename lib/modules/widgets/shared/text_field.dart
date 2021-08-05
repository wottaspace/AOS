import 'package:flutter/material.dart';

class KTextField extends StatelessWidget {
  const KTextField(
      {Key? key,
      required this.labelText,
      required this.hintText,
      required this.prefixIcon,
      this.suffixIcon})
      : super(key: key);

  final String labelText, hintText;
  final prefixIcon, suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        suffixIcon: suffixIcon,
        hintText: hintText,
        prefixIcon: prefixIcon,
        contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 22),
        border: OutlineInputBorder(),
      ),
    );
  }
}
