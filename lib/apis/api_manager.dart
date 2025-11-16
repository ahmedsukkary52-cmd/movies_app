import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:team_flutter_6_movie_app/apis/api_constants.dart';
import 'package:team_flutter_6_movie_app/apis/end_points.dart';
import 'package:team_flutter_6_movie_app/model/delete_profile.dart';
import 'package:team_flutter_6_movie_app/model/update_profile_request.dart';
import 'package:team_flutter_6_movie_app/model/update_profile_response.dart';

class ApiManager {
  static Future<UpdateProfileResponse> updateProfilePatch({
    required String token,
    required UpdateProfileRequest requestBody,
  }) async {
    final url = Uri.parse("${ApiConstants.baseUrl}${EndPoints.updateProfile}");
    try {
      final response = await http.patch(
        url,
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        },
        body: jsonEncode(requestBody),
      );
      final json = jsonDecode(response.body);
      return UpdateProfileResponse.fromJson(json);
    } catch (e) {
      return UpdateProfileResponse(
        message: "Unexpected error",
        error: e.toString(),
        statusCode: 500,
      );
    }
  }

  static Future<DeleteProfileResponse> deleteProfile({
    required String token,
  }) async {
    final url = Uri.parse("${ApiConstants.baseUrl}${EndPoints.updateProfile}");
    try {
      final response = await http.delete(
        url,
        headers: {"Authorization": "Bearer $token"},
      );
      final json = jsonDecode(response.body);
      return DeleteProfileResponse.fromJson(json);
    } catch (error) {
      rethrow;
    }
  }
}
