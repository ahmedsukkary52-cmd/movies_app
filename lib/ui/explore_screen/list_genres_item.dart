import 'package:flutter/material.dart';
import 'package:team_flutter_6_movie_app/Utils/color_App.dart';
import 'package:team_flutter_6_movie_app/Utils/extension/extension.dart';
import 'package:team_flutter_6_movie_app/Utils/text_app.dart';

class ListGenresItem extends StatelessWidget {
  const ListGenresItem({
    super.key,
    required this.isSelected,
    required this.text,
  });
  final bool isSelected;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsetsGeometry.symmetric(
        horizontal: context.width * .04,
        vertical: context.height * .01,
      ),
      decoration: BoxDecoration(
        color: isSelected ? ColorApp.primaryWallow : ColorApp.primaryBlack,
        borderRadius: BorderRadius.circular(16),
        border: BoxBorder.all(color: ColorApp.primaryWallow, width: 2),
      ),
      child: Text(
        text,
        style: isSelected ? TextApp.bold20Black : TextApp.bold20Wallow,
      ),
    );
  }
}
