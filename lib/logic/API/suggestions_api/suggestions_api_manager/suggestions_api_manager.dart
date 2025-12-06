import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:team_flutter_6_movie_app/logic/API/suggestions_api/suggestions_api_manager/suggestions_api_constant.dart';
import 'package:team_flutter_6_movie_app/logic/API/suggestions_api/suggestions_api_manager/suggestions_api_endpoint.dart';

import '../suggestions_model/suggestions_model.dart';

class SuggestionsApiManager {
  static Future<SuggestionsResponse> getMovieSuggestion({
    required num movieId,
  }) async {
    try {
      final String url =
          "${SuggestionsApiConstant.baseUrl}${SuggestionsApiEndpoint.suggestionName}?${SuggestionsApiEndpoint.movieId}=$movieId&with_cast=true&with_images=true";
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonMap = jsonDecode(response.body);
        return SuggestionsResponse.fromJson(jsonMap);
      } else {
        print("Server Error: ${response.statusCode}");
        return SuggestionsResponse(
          status: "error",
          statusMessage: "Server returned ${response.statusCode}",
          data: Data(movies: []),
        );
      }
    } catch (e) {
      print("Exception in SuggestionsApi: $e");
      return SuggestionsResponse(
        status: "error",
        statusMessage: "Exception occurred",
        data: Data(movies: []),
      );
    }
  }
}
