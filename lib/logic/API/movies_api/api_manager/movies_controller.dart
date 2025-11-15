import 'package:team_flutter_6_movie_app/logic/API/movies_api/api_manager/movies_api_manager.dart';
import 'package:team_flutter_6_movie_app/logic/API/movies_api/movies_model/movies_model.dart';

class MoviesController {
  bool isLoading = false;
  int currentPage = 1;
  bool hasMore = true;
  List<Movies> allMovies = [];

  Future<void> fetchMovies() async {
    isLoading = true;
    currentPage = 1;
    hasMore = true;
    allMovies = [];

    try {
      final MoviesResponse response = await MoviesApiManager.getMoviesList(page: currentPage);

      print('Response status: ${response.status}');
      print('Movies count in data: ${response.data?.movies?.length}'); // <--- هنا

      if (response.status == "ok" && response.data?.movies != null) {
        allMovies = response.data!.movies!;
        hasMore = allMovies.isNotEmpty;
      } else {
        hasMore = false;
        allMovies = [];
      }
    } catch (e) {
      print('Error fetching movies: $e');
      hasMore = false;
      allMovies = [];
    } finally {
      isLoading = false;
    }
  }


  Future<void> loadMoreMovies() async {
    if (isLoading || !hasMore) return;

    isLoading = true;
    currentPage++;

    try {
      final MoviesResponse response = await MoviesApiManager.getMoviesList(page: currentPage);

      if (response.status == "ok" &&
          response.data != null &&
          response.data?.movies != null &&
          (response.data?.movies?.isNotEmpty ?? false)) {
        allMovies.addAll(response.data!.movies!);
      } else {
        hasMore = false;
      }
    } catch (e) {
      hasMore = false;
    } finally {
      isLoading = false;
    }
  }
}
