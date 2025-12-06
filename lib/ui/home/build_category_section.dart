import 'package:flutter/material.dart';
import 'package:team_flutter_6_movie_app/Utils/extension/extension.dart';

import '../../Utils/text_app.dart';
import '../../logic/API/movies_list_api/movies_model/movies_model.dart';
import 'movie_item.dart';

class CategorySection extends StatelessWidget {
  final String genre;
  final List<Movies> movies;
  final VoidCallback onSeeMore;
  final Function(Movies movie) onTabMovie;
  const CategorySection({
    super.key,
    required this.genre,
    required this.movies,
    required this.onSeeMore,
    required this.onTabMovie,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width * .04),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(genre, style: TextApp.regular20White),
              TextButton(onPressed: onSeeMore, child: Text('See More', style: TextApp.regular16Wallow)),
            ],
          ),
        ),
        SizedBox(height: context.height * .01),
        SizedBox(
          height: context.height * .23,
          child: ListView.separated(
            padding: EdgeInsetsDirectional.only(start: context.width * .04),
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            separatorBuilder: (context, index) => SizedBox(width: context.width * .04),
            itemBuilder: (context, index) {
              final movie = movies[index];
              return InkWell( onTap: () => onTabMovie(movie),child: MovieItem(isSmall: true, movie: movie) ,);
            },
          ),
        ),
        SizedBox(height: context.height * .02),
      ],
    );
  }
}
