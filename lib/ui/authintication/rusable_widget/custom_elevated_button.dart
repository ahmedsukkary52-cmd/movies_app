import 'package:flutter/material.dart';
import 'package:team_flutter_6_movie_app/Utils/assets_app.dart';
import 'package:team_flutter_6_movie_app/Utils/color_App.dart';
import 'package:team_flutter_6_movie_app/Utils/extension/extension.dart';
import 'package:team_flutter_6_movie_app/Utils/text_app.dart';

class CustomElevatedButton extends StatelessWidget {
  final double? height;
  final TextStyle? textStyle ;
  final Color background;
  final bool hasIcon;
  final String text;
  final String? iconImage;
  final Color? iconColor;
  final VoidCallback? onPressed;
  final bool hasBorder;
  final Widget? customWidgetWithIcon;
  const CustomElevatedButton({
    super.key,
    this.iconImage,
    this.customWidgetWithIcon,
    this.height,
    this.iconColor,
    this.hasIcon = false,
    required this.text,
    required this.onPressed,
    this.background = ColorApp.primaryWallow,
    this.textStyle,
    this.hasBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height ?? context.height * 0.06,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: hasBorder ? ColorApp.transparent : background,
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: hasBorder ?  BorderSide(color: ColorApp.primaryWallow,width: 2):BorderSide(),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: onPressed,
        child: hasIcon == true
            ? customWidgetWithIcon ??Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageIcon(
                    AssetImage( iconImage ??PathImage.google ),
                    color: iconColor ??ColorApp.primaryBlack,
                    size: 22,
                  ),
                   SizedBox(width: context.width* .02),
                  Text(text, style: TextApp.regular20black),
                ],)
            : Text(text, style: textStyle ?? TextApp.regular20black),
      ),
    );
  }
}
