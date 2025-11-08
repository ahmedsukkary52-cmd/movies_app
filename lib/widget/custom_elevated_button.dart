import 'package:flutter/material.dart';
import 'package:team_flutter_6_movie_app/Utils/color_App.dart';
import 'package:team_flutter_6_movie_app/Utils/text_app.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String? text;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final Color? borderSideColor;
  final bool hasIcon;
  final Widget? customInButton;
  final EdgeInsetsGeometry? padding;
 const CustomElevatedButton({
    super.key,
    this.customInButton,
    this.hasIcon = false,
    required this.onPressed,
    this.text,
    this.textStyle,
    this.backgroundColor,
    this.borderSideColor,
    this.padding
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: padding ?? EdgeInsets.symmetric(vertical: height * 0.018),
        backgroundColor: backgroundColor ?? ColorApp.primaryWallow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(16),
          side: BorderSide(
            color: borderSideColor ?? ColorApp.transparent,
            width: 1,
          ),
        ),
        elevation: 0,
      ),
      child: hasIcon
          ? customInButton
          : Text(text ?? '', style: textStyle ?? TextApp.regular20Black),
    );
  }
}
