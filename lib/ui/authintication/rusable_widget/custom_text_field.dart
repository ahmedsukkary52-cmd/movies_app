import 'package:flutter/material.dart';
import '../../../Utils/color_App.dart';
import '../../../Utils/text_app.dart';

typedef OnValidator = String? Function(String?)?;

class CustomTextField extends StatefulWidget {
  final Widget prefixIconName;
  final bool hasSuffix;
  final bool obsecureText;
  final bool isNumber ;
  final String hintText;
  final TextEditingController? controller;
  final OnValidator validator;
  const CustomTextField({
    super.key,
    required this.prefixIconName,
    required this.hintText,
    required this.controller,
    required this.validator,
    this.hasSuffix = false,
    this.obsecureText = false,
    this.isNumber = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool isObsecured;
  @override
  void initState() {
    super.initState();
    isObsecured = widget.obsecureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType:widget.isNumber? TextInputType.numberWithOptions():null,
      style: TextApp.regular16White,
      cursorColor: ColorApp.whiteColor,
      controller: widget.controller,
      validator: widget.validator,
      obscureText: isObsecured,
      decoration: InputDecoration(
        hoverColor:ColorApp.whiteColor,
        filled: true,
        fillColor: ColorApp.grayColor,
        enabledBorder: buildOutlineInputBorder(ColorApp.transparent),
        errorBorder: buildOutlineInputBorder(ColorApp.primaryWallow),
        focusedBorder: buildOutlineInputBorder(ColorApp.transparent),
        focusedErrorBorder: buildOutlineInputBorder(ColorApp.primaryWallow),
        hintText: widget.hintText,
        hintStyle: TextApp.regular16White,
        prefixIcon: widget.prefixIconName,
        suffixIcon: widget.hasSuffix
            ? InkWell(
                onTap: () {
                  setState(() {
                    isObsecured = !isObsecured;
                  });
                },
                child: isObsecured
                    ? Icon(Icons.visibility_off, color: ColorApp.whiteColor, size: 26)
                    : Icon(Icons.visibility, color: ColorApp.whiteColor, size: 26),
              )
            : null,
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder(Color borderColor) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(width: 1, color: borderColor),
    );
  }
}
