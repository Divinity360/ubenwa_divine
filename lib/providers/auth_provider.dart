import 'package:flutter/material.dart';
import 'package:ubenwa/services/api_service.dart';

class AuthProvider extends ChangeNotifier {
  bool _loading = false;

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void register(
      {required String email,
      required String password,
      required String name}) async {
    loading = true;
    final response = await ApiService.register(
        email: email, password: password, firstName: name);
    loading = false;
  }
}
