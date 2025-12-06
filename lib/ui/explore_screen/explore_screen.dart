import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_flutter_6_movie_app/Utils/extension/extension.dart';
import 'package:team_flutter_6_movie_app/Utils/routes_app.dart';

import '../../cubits/bottomNavBarCubit/bottom_nav_cubit.dart';
import '../../logic/API/movies_list_api/api_manager/movies_controller.dart';
import '../../logic/API/movies_list_api/movies_model/movies_model.dart';
import '../home/movie_item.dart';
import 'list_genres_item.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final MoviesController controller = MoviesController();
  Map<String, List<Movies>> moviesGenres = {};
  List<String> allGenres = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadMoviesAndGenres();
  }

  Future<void> loadMoviesAndGenres() async {
    setState(() => isLoading = true);

    await controller.fetchMovies();

    _updateGenresMap();

    setState(() => isLoading = false);

    final selectedGenre =
        context.read<NavigationCubit>().state.selectedGenre ?? allGenres.first;
    await _loadMoreIfFewMovies(selectedGenre);
  }

  void _updateGenresMap() {
    Map<String, List<Movies>> genresMap = {};
    for (var movie in controller.allMovies) {
      for (var g in movie.genres ?? []) {
        genresMap.putIfAbsent(g, () => []).add(movie);
      }
    }

    List<String> genresList = genresMap.keys.toList();

    final cubit = context.read<NavigationCubit>();
    String? selected = cubit.state.selectedGenre;

    if (selected != null && genresList.contains(selected)) {
      genresList.remove(selected);
      genresList.insert(0, selected);
    } else if (selected == null && genresList.isNotEmpty) {
      selected = genresList.first;
      cubit.selectGenre(selected);
    }

    setState(() {
      moviesGenres = genresMap;
      allGenres = genresList;
    });
  }

  Future<void> _loadMoreIfFewMovies(String genre) async {
    if ((moviesGenres[genre]?.length ?? 0) < 4 &&
        controller.hasMore &&
        !controller.isLoading) {
      setState(() => isLoading = true);
      await controller.loadMoreMovies();
      _updateGenresMap();
      setState(() => isLoading = false);

      if ((moviesGenres[genre]?.length ?? 0) < 4 && controller.hasMore) {
        await _loadMoreIfFewMovies(genre);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedGenre = context.watch<NavigationCubit>().state.selectedGenre;

    return Scaffold(
      body: SafeArea(
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  SizedBox(height: context.height * .01),
                  SizedBox(
                    height: context.height * .06,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(
                        horizontal: context.width * .04,
                      ),
                      itemBuilder: (context, index) {
                        final genre = allGenres[index];
                        return GestureDetector(
                          onTap: () async {
                            context.read<NavigationCubit>().selectGenre(genre);
                            await _loadMoreIfFewMovies(genre);
                          },
                          child: ListGenresItem(
                            text: genre,
                            isSelected: genre == selectedGenre,
                          ),
                        );
                      },
                      separatorBuilder: (_, __) =>
                          SizedBox(width: context.width * .02),
                      itemCount: allGenres.length,
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.all(12),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: context.height * .3,
                        crossAxisSpacing: context.width * .04,
                        mainAxisSpacing: context.width * .04,
                      ),
                      itemCount: moviesGenres[selectedGenre]?.length ?? 0,
                      itemBuilder: (context, index) {
                        final movie = moviesGenres[selectedGenre]![index];
                        return InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, RoutesApp.movieDetails , arguments: movie);
                          },
                            child: MovieItem(movie: movie, isSmall: true));
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
