import '../movie_details_model/movie_details_model.dart';
import 'movie_details_api_manager.dart';

class MovieDetailsApiController {
  Future<MovieDetailsResponse> fetchDetails({required num movieId}) async {
    try {
      final response = await MoviesDetailsApiManager().getMoviesDetails(movieId: movieId);
      return response;
    } catch (e) {
      print('Error fetching details: $e');
      return MovieDetailsResponse(
        status: "error",
        statusMessage: e.toString(),
        data: Data(),
      );
    }
  }
}
