import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:team_flutter_6_movie_app/logic/API/suggestions_api/suggestions_api_manager/suggestions_api_constant.dart';
import 'package:team_flutter_6_movie_app/logic/API/suggestions_api/suggestions_api_manager/suggestions_api_endpoint.dart';
import 'package:team_flutter_6_movie_app/logic/API/suggestions_api/suggestions_model/suggestions_model.dart';

class SuggestionsApiManager {
  static Future<SuggestionsResponse> getMovieSuggestion({
    required String movieId,
  }) async {
    try {
      final String url =
          "${SuggestionsApiConstant.baseUrl}${SuggestionsApiEndpoint.suggestionName}?${SuggestionsApiEndpoint.movieId}=$movieId";
      final response = await http.get(Uri.parse(url));
      if (response.statusCode != 200) {
        throw Exception("Server Error: ${response.statusCode}");
      }
      final jsonMap = jsonDecode(response.body);
      return SuggestionsResponse.fromJson(jsonMap);
    } catch (e) {
      rethrow;
    }
  }
}
