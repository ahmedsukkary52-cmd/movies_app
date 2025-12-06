import 'package:team_flutter_6_movie_app/logic/API/suggestions_api/suggestions_api_manager/suggestions_api_manager.dart';

import '../suggestions_model/suggestions_model.dart';

class SuggestionsController {
  Future<SuggestionsResponse> fetchSuggestions({required num movieId}) async {
    try {
      final response = await SuggestionsApiManager.getMovieSuggestion(movieId: movieId);
      return response;
    } catch (e) {
      print('Error fetching suggestions: $e');
      return SuggestionsResponse(
        status: "error",
        statusMessage: e.toString(),
        data: Data(movies: []),
      );
    }
  }
}
