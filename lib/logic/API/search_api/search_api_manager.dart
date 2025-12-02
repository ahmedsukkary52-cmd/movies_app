import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:team_flutter_6_movie_app/logic/API/movies_list_api/movies_model/movies_model.dart';
import 'package:team_flutter_6_movie_app/logic/API/search_api/search_api_constants.dart';
import 'package:team_flutter_6_movie_app/logic/API/search_api/search_end_points.dart';

class SearchApiManager {
  ///https://yts.lt/api/v2/list_movies.json
  static Future<MoviesResponse> getSearch(String? searchText) async {
    var url = Uri.https(
      SearchApiConstants.baseUrl,
      SearchEndPoints.searchEndPoint,
      {'query_term': searchText},
    );
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var responseBodyJson = jsonDecode(responseBody);
      return MoviesResponse.fromJson(responseBodyJson);
    } catch (error) {
      rethrow;
    }
  }
}
