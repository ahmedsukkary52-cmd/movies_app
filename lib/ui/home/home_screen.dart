import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:team_flutter_6_movie_app/Utils/assets_app.dart';
import 'package:team_flutter_6_movie_app/Utils/extension/extension.dart';
import 'package:team_flutter_6_movie_app/Utils/text_app.dart';
import 'package:team_flutter_6_movie_app/ui/home/build_category_section.dart';
import 'package:team_flutter_6_movie_app/ui/home/movie_item.dart';

import '../../logic/API/movies_list_api/api_manager/movies_controller.dart';
import '../../logic/API/movies_list_api/movies_model/movies_model.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MoviesController controller = MoviesController();

  Map<String, List<Movies>> moviesByGenre = {};
  List<String> selectedGenres = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadMoviesAndGroup();
  }

  Future<void> _loadMoviesAndGroup() async {
    setState(() => isLoading = true);

    await controller.fetchMovies();

    Map<String, List<Movies>> tmp = {};
    for (var movie in controller.allMovies) {
      if (movie.genres != null) {
        for (var g in movie.genres!) {
          tmp.putIfAbsent(g, () => []);
          tmp[g]!.add(movie);
        }
      }
    }

    List<String> allGenres = tmp.keys.toList();
    allGenres.shuffle();
    final picks = allGenres.take(allGenres.length >= 3 ? 3 : allGenres.length).toList();

    setState(() {
      moviesByGenre = tmp;
      selectedGenres = picks;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(PathImage.homeBg),
            alignment: Alignment.topCenter,
          ),
        ),
        child: isLoading || controller.isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: context.height*.14,),
              if (controller.allMovies.isNotEmpty)
                CarouselSlider.builder(
                  itemCount: controller.allMovies.length,
                  itemBuilder: (context, index, realIndex) {
                    final movie = controller.allMovies[index];
                    return MovieItem(movie: movie, isSmall: false);
                  },
                  options: CarouselOptions(
                    height: context.height * .35,
                    enlargeCenterPage: true,
                    viewportFraction: .56,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    enlargeFactor: 0.4,
                    autoPlay: true,
                    onPageChanged: (index, reason) async {
                      if (index >= controller.allMovies.length - 3 &&
                          controller.hasMore &&
                          !controller.isLoading) {
                        await controller.loadMoreMovies();
                        Map<String, List<Movies>> tmp = {};
                        for (var m in controller.allMovies) {
                          if (m.genres != null) {
                            for (var g in m.genres!) {
                              tmp.putIfAbsent(g, () => []);
                              tmp[g]!.add(m);
                            }
                          }
                        }
                        setState(() {
                          moviesByGenre = tmp;
                        });
                      }
                    },
                  ),
                )
              else
                SizedBox(
                  height: context.height * .35,
                  child: Center(child: Text('No movies',style: TextApp.medium36White,)),
                ),

              SizedBox(height: context.height * .03),

              if (selectedGenres.isEmpty)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: context.height * .04),
                  child: Text('No categories available', style: TextApp.medium36White),
                )
              else
                SizedBox(height: context.height*.18,),
                ...selectedGenres.map((g) => CategorySection(
                    genre: g,
                    movies: moviesByGenre[g] ?? [],
                    onSeeMore: (){
                      // todo: navigation to categories tab
                    }
                )),
            ],
          ),
        ),
      ),
    );
  }
}
