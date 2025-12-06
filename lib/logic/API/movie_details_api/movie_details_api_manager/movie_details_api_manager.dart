import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:team_flutter_6_movie_app/logic/API/movie_details_api/movie_details_api_manager/movie_details_api_constant.dart';
import 'package:team_flutter_6_movie_app/logic/API/movie_details_api/movie_details_api_manager/movie_details_endpoint.dart';

import '../movie_details_model/movie_details_model.dart';

class MoviesDetailsApiManager{

  Future<MovieDetailsResponse> getMoviesDetails({required num movieId})async{
    Uri url = Uri.https(
      MovieDetailsApiConstant.serverName,
      "${MovieDetailsApiConstant.apiBasePath}${MovieDetailsEndpoint.apiMovieDetails}",
      {
        MovieDetailsEndpoint.movieDetails: movieId.toString(),
        MovieDetailsEndpoint.withCast: 'true',
        MovieDetailsEndpoint.withImage: 'true',
      },
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