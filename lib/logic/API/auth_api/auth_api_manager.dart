import 'dart:convert';
import 'package:http/http.dart' as http;

import 'auth_api_constant.dart';
import 'auth_api_endpoint.dart';

class AuthApiManager {
  static Future<String> resetPassword({
    required String oldPassword,
    required String newPassword,
    required String token,
  }) async {
    try {
      final String url =
          "${AuthApiConstant.baseUrl}${AuthApiEndpoint.resetPassword}";

      final response = await http.patch(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode({
          "oldPassword": oldPassword,
          "newPassword": newPassword,
        }),
      );

      if (response.statusCode == 201) {
        final jsonMap = jsonDecode(response.body);
        return jsonMap["message"];
      } else {
        throw Exception(
            "Error: ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      rethrow;
    }
  }
}
