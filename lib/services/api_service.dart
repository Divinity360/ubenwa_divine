import 'dart:developer';

import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl =
      'https://ubenwa-cat-api-stage.herokuapp.com/api/v1';

  static Future register(
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
  }

  static Future login({required String email, required String password}) async {
    var params = {"email": email, "password": password};
    var response = await http.post(
        Uri.parse(
          '$baseUrl/login',
        ),
        body: params);
    log(response.body);
  }
}
