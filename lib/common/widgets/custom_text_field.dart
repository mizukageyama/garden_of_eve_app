import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:garden_of_eve/constants/_constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.minLines = 1,
    required this.labelText,
    this.controller,
    this.floatLabel = false,
    this.callback,
    this.validator,
    this.keyboardType,
    this.inputFormatters,
    this.obscureText = false,
    this.borderRadius = const BorderRadius.all(
      Radius.circular(
        10.0,
      ),
    ),
  }) : super(key: key);

  final int minLines;
  final String labelText;
  final TextEditingController? controller;
  final bool floatLabel;
  final VoidCallback? callback;
  final String? Function(String?)? validator;
  final BorderRadius borderRadius;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      minLines: minLines,
      style: quicksandSemiBold.copyWith(
        color: darkGreyColor,
        fontSize: 14,
      ),
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelStyle: quicksandSemiBold.copyWith(
          color: neutralGreyColor,
          fontSize: 14,
        ),
        filled: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        fillColor: whiteColor,
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: const BorderSide(
            color: neutralGreyColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: const BorderSide(
            color: neutralGreyColor,
          ),
        ),
        floatingLabelBehavior: floatLabel ? null : FloatingLabelBehavior.never,
      ),
      inputFormatters: inputFormatters,
      onFieldSubmitted: (value) {
        callback!();
      },
      validator: validator,
    );
  }
}
