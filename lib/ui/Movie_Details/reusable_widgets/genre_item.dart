import 'package:flutter/material.dart';
import 'package:team_flutter_6_movie_app/Utils/color_App.dart';
import 'package:team_flutter_6_movie_app/Utils/extension/extension.dart';
import 'package:team_flutter_6_movie_app/Utils/text_app.dart';

class GenreItem extends StatelessWidget {
  final String genre;
  const GenreItem({super.key , required this.genre});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentGeometry.center,
      padding: EdgeInsets.symmetric(horizontal: context.width * .04 , vertical: context.height * .01),
      decoration: BoxDecoration(
        color: ColorApp.grayColor,
        borderRadius: BorderRadius.circular(16)
      ),
      child: Text(genre,style: TextApp.regular16White,),
    );
  }
}
