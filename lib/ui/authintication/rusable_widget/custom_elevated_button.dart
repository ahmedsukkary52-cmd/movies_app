import 'package:flutter/material.dart';
import 'package:team_flutter_6_movie_app/Utils/assets_app.dart';
import 'package:team_flutter_6_movie_app/Utils/color_App.dart';
import 'package:team_flutter_6_movie_app/Utils/extension/extension.dart';
import 'package:team_flutter_6_movie_app/Utils/text_app.dart';

typedef OnPressed = void Function()?;

class CustomElevatedButton extends StatelessWidget {
  final bool hasIcon;
  final String text;
  final OnPressed onPressed;
  const CustomElevatedButton({
    super.key,
    this.hasIcon = false,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: context.height * 0.08,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorApp.primaryWallow,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: onPressed,
        child: hasIcon == true
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageIcon(
                    AssetImage( PathImage.google ),
                    color: ColorApp.primaryBlack,
                    size: 22,
                  ),
                  const SizedBox(width: 10),
                  Text(text, style: TextApp.regular20black),
                ],)
            : Text(text, style: TextApp.regular20black),
      ),
    );
  }
}
