import 'package:flutter/material.dart';
import 'package:team_flutter_6_movie_app/Utils/extension/extension.dart';

class ContainerButton extends StatelessWidget {
  Color color;
  String text;
  void Function()? onTap;
  TextStyle textStyle;

  ContainerButton({
    super.key,
    required this.text,
    required this.color,
    required this.onTap,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: context.height * 0.01),
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          vertical: context.height * 0.01,
          horizontal: context.width * 0.02,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color,
        ),
        child: Text(text, style: textStyle),
      ),
    );
  }
}
