import 'package:flutter/material.dart';
import 'package:team_flutter_6_movie_app/Utils/color_App.dart';
import 'package:team_flutter_6_movie_app/Utils/extension/extension.dart';
import 'package:team_flutter_6_movie_app/Utils/text_app.dart';

import '../../Utils/assets_app.dart';
import '../../logic/API/movies_list_api/movies_model/movies_model.dart';

class MovieItem extends StatelessWidget {
  final Movies movie;
  final bool isSmall;

  const MovieItem({super.key, required this.movie, this.isSmall = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.width * .04, vertical: context.height * .012),
      alignment: Alignment.topLeft,
      width: isSmall ? context.width * .33 : context.width * .5,
      height: isSmall ? context.height * .1 : context.height * .4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: movie.mediumCoverImage != null
            ? DecorationImage(
          image: NetworkImage(movie.mediumCoverImage!),
          fit: BoxFit.cover,
        )
            : null,
        color: ColorApp.grayColor,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: ColorApp.transparentGray,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(horizontal: context.width * .02, vertical: context.height * .005),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('${movie.rating ?? 0}', style: TextApp.regular16White),
            const SizedBox(width: 4),
            Image.asset(PathImage.star,width: 15,height: 15,)          ],
        ),
      ),
    );
  }
}
