import 'package:team_flutter_6_movie_app/logic/API/suggestions_api/suggestions_api_manager/suggestions_api_manager.dart';
import 'package:team_flutter_6_movie_app/logic/API/suggestions_api/suggestions_model/suggestions_model.dart';
class SuggestionsController {
  bool isLoading = false;
  List<Movies> suggestions = [];

  Future<void> fetchSuggestions({required String movieId}) async {
    isLoading = true;
    suggestions = [];

    try {
      final SuggestionsResponse response =
      await SuggestionsApiManager.getMovieSuggestion(movieId: movieId);

      if (response.status == "ok" && response.data?.movies != null) {
        suggestions = response.data!.movies!;
      } else {
        suggestions = [];
      }
    } catch (e) {
      print('Error fetching suggestions: $e');
      suggestions = [];
    } finally {
      isLoading = false;
    }
  }
}
