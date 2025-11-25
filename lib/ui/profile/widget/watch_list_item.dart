import 'package:flutter/material.dart';
import 'package:team_flutter_6_movie_app/Utils/extension/extension.dart';

import '../../../Utils/color_App.dart';
import '../../../Utils/text_app.dart';

class WatchListItem extends StatelessWidget{
  const WatchListItem({super.key,required this.watchListMovieImage,required this.imdbRate});
   final String watchListMovieImage;
  final String  imdbRate;
  @override
  Widget build(BuildContext context) {
    final ImageProvider imageProvider =
    watchListMovieImage.startsWith('http')
        ? NetworkImage(watchListMovieImage)
        : AssetImage(watchListMovieImage);
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.fill)
      ),
      child: Padding(
          padding:  EdgeInsets.symmetric(
              vertical: context.width*0.015,
              horizontal: context.height*0.008
          ),
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: ColorApp.transparentGray,
            ),
              width: context.width*0.15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('$imdbRate ⭐',style: TextApp.regular16White,)
                ],
              ),
            ),
          )
      ),
    );
  }

}