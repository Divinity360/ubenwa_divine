import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ubenwa/models/newborns.dart';
import 'package:ubenwa/models/signup_response.dart';
import 'package:ubenwa/utils/helper.dart';

class ApiService {
  static const String baseUrl =
      'https://ubenwa-cat-api-stage.herokuapp.com/api/v1';

  static Future<SignUpResponse?>? register(
      {required String email,
      required String password,
      required String firstName,
      String lastName = ''}) async {
    Map params = {
      "email": email,
      "password": password,
      "first_name": firstName,
      "last_name": lastName,
      "password_confirmation": password
    };
    var response = await http.post(Uri.parse("$baseUrl/signup"), body: params);
    log(response.body);
    if (response.statusCode == HttpStatus.ok) {
      return SignUpResponse.fromJson(json.decode(response.body));
    }
    return null;
  }

  static Future<List<NewBorn>?>? getAllNewBorn(String authToken) async {
    var response = await http.get(Uri.parse('$baseUrl/newborns'),
        headers: _getHttpHeader(authToken));
    log(response.body);
    if (response.statusCode == HttpStatus.ok) {
      final dataList = json.decode(response.body)["data"];
      return dataList.map<NewBorn>((item) => NewBorn.fromJson(item)).toList();
    }
    return [];
  }

  static Future<SignUpResponse?>? login(
      {required String email, required String password}) async {
    var params = {"email": email, "password": password};
    var response = await http.post(Uri.parse('$baseUrl/login'), body: params);
    log(response.body);
    if (response.statusCode == HttpStatus.ok) {
      return SignUpResponse.fromJson(json.decode(response.body));
    }
    return null;
  }

  static Future addNewborns(String authToken) async {
    String _generatedName = AppHelpers.getRandomString(6);
    Map<String, dynamic> params = {
      "data": {
        "type": "newborns",
        "attributes": {
          "name": _generatedName,
          "gestation": "2021-08-26T12:04:50.821Z",
          "gender": "male"
        }
      }
    };
    var response = await http.post(Uri.parse('$baseUrl/newborns'),
        headers: _getVndApiHttpHeader(authToken), body: json.encode(params));
    log(response.body);
    return null;
  }

  static Map<String, String> _getHttpHeader(String token) =>
      {'Authorization': 'Bearer $token'};

  static Map<String, String> _getVndApiHttpHeader(String token) => {
        "Content-Type": "application/vnd.api+json",
        'Authorization': 'Bearer $token'
      };
}
