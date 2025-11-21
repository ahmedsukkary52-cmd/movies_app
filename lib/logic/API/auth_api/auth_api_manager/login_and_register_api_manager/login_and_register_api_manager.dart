import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:team_flutter_6_movie_app/logic/API/auth_api/auth_api_manager/auth_api_constant.dart';
import 'package:team_flutter_6_movie_app/logic/API/auth_api/auth_api_manager/auth_api_endpoint.dart';

import '../../auth_model/login_responce.dart';
import '../../auth_model/register_responce.dart';

class ApiManager {
  static Future<RegisterResponse> register({
    required String email,
    required String password,
    required String confirmPassword,
    required String name,
    required String phone,
    required int avaterId
  }) async {
    try {
      Uri url = Uri.https(AuthApiConstant.authority, AuthApiEndpoint.apiRegisterName);
      var response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(<String, dynamic>
        {
          "email": email,
          "password": password,
          "confirmPassword": confirmPassword,
          "name": name,
          "phone": phone,
          "avaterId": avaterId,
        }
        ),
      );
      var json = jsonDecode(response.body);
      return RegisterResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
  static Future<LoginResponse> login(String email,String password)async{
    Uri url = Uri.https(AuthApiConstant.authority,AuthApiEndpoint.apiLoginName);
    try{
      var responce = await http.post(
        url,
        body:jsonEncode(<String, String> //convert json to object
        {
          "email":email,
          "password":password
        }
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      String responceBody = responce.body ;
      var json = jsonDecode(responceBody);
      return LoginResponse.fromJson(json);
    }catch(e){
      rethrow;
    }
  }
}