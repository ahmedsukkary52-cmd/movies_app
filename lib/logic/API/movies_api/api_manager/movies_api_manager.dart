import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:team_flutter_6_movie_app/Model_Api/movie_details_model.dart';
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

class MoviesDetailsApiManager{

   Future<MovieDetailsResponse> getMoviesDetails({required String movieId})async{
     Uri url = Uri.http(
       MoviesApiConstant.serverName,
       MoviesApiEndpoint.apiMovieDetails,
       {
         'movie_id': movieId
       }
     );
     try{
       var response = await http.get(url);
       if(response.statusCode != 200){
         throw Exception("Server Error: ${response.statusCode}");
       }
       var responseBody = response.body;
       var json = jsonDecode(responseBody);
       return MovieDetailsResponse.fromJson(json);
     }catch(e){
       rethrow;
     }
   }
}