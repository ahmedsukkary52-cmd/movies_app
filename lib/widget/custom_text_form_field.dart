import 'package:flutter/material.dart';
import '../Utils/color_App.dart';
import '../Utils/text_app.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final Color BorderSideColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final String? labelText;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final String obscuringCharacter;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextInputType keyboardType;
  final int? maxLines;
  const CustomTextFormField({
    super.key,
    this.controller,
    this.maxLines,
    this.BorderSideColor = ColorApp.transparent,
    this.prefixIcon,
    this.labelText,
    this.hintText,
    this.suffixIcon,
    this.hintStyle,
    this.labelStyle,
    this.validator,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.obscuringCharacter = '.'
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      style: TextApp.regular16White,
      maxLines: maxLines ?? 1,
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      keyboardType: keyboardType,
      obscuringCharacter: obscuringCharacter,
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorApp.grayColor,
        border: outlineInputBorder(BorderSideColor: BorderSideColor),
        enabledBorder: outlineInputBorder(BorderSideColor: BorderSideColor),
        focusedBorder: outlineInputBorder(BorderSideColor: BorderSideColor),
        errorBorder: outlineInputBorder(BorderSideColor: ColorApp.redColor),
        focusedErrorBorder: outlineInputBorder(
          BorderSideColor: ColorApp.redColor,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: hintStyle ?? TextApp.regular16White,
        labelText: labelText,
        labelStyle: labelStyle,
      ),
    );
  }

  OutlineInputBorder outlineInputBorder({required Color BorderSideColor}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
        color: BorderSideColor,
        width: 1,
        style: BorderStyle.solid,
      ),
    );
  }
}
