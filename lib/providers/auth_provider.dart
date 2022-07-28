import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ubenwa/main.dart';
import 'package:ubenwa/models/user_info.dart';
import 'package:ubenwa/services/api_service.dart';
import 'package:ubenwa/utils/helper.dart';
import 'package:ubenwa/utils/routes.dart';
import 'package:ubenwa/utils/extensions.dart';

class AuthProvider extends ChangeNotifier {
  bool _loading = false;
  UserInfo? _userInfo;
  SharedPreferences? _prefs;

  bool get loading => _loading;


  UserInfo? get userInfo => _userInfo;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }


  set userInfo(UserInfo? value) {
    _userInfo = value;
    notifyListeners();
  }

  void register(
      {required String email,
      required String password,
      required String name}) async {
    loading = true;
    final _prefs = await getPreferences();
    final response = await ApiService.register(
        email: email, password: password, firstName: name);
    if (response != null) {
      userInfo = response.userInfo;
      _prefs.setAuthToken(response.token!);
      Navigator.of(navigationKeyState.currentContext!)
          .pushNamed(AppRoutes.home);
    } else {
      AppHelpers.toastMessage('An error occurred');
    }
    loading = false;
  }

  void login({required String email, required String password}) async {
    loading = true;
    final _prefs = await getPreferences();
    final response = await ApiService.login(email: email, password: password);
    if (response != null) {
      userInfo = response.userInfo;
      _prefs.setAuthToken(response.token!);
      log(_prefs.authToken ?? 'null', name: 'AUTH');
      Navigator.of(navigationKeyState.currentContext!)
          .pushNamed(AppRoutes.home);
    } else {
      AppHelpers.toastMessage('An error occurred');
    }
    loading = false;
  }

  Future<SharedPreferences> getPreferences() async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs!;
  }
}
