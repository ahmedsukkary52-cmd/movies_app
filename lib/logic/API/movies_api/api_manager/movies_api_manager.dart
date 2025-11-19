import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:team_flutter_6_movie_app/logic/API/movies_api/api_manager/movies_api_constant.dart';
import 'package:team_flutter_6_movie_app/logic/API/movies_api/api_manager/movies_api_endpoint.dart';
import 'package:team_flutter_6_movie_app/logic/API/movies_api/movies_model/movies_model.dart';
class MoviesApiManager {
  static Future<MoviesResponse> getMoviesList
      ({int page = 1 , int limit = 20}) async{
    try{
      final String url =
          "${MoviesApiConstant.baseUrl}${MoviesApiEndpoint.listMovies}?${MoviesApiConstant.page}=$page&${MoviesApiConstant.limit}=$limit";
      final response = await http.get(Uri.parse(url));
   if(response.statusCode != 200){
     throw Exception("Server Error: ${response.statusCode}");
   }
   final jsonMap = jsonDecode(response.body);
   return MoviesResponse.fromJson(jsonMap);

    }catch(e){
      rethrow;
    }
  }
}