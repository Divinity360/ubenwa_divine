import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ubenwa/models/newborns.dart';
import 'package:ubenwa/services/api_service.dart';
import 'package:ubenwa/utils/extensions.dart';

class NewBornProvider extends ChangeNotifier {
  bool _loading = true;
  List<NewBorn>? _newBornList;
  SharedPreferences? _prefs;

  bool get loading => _loading;

  List<NewBorn>? get newBornList => _newBornList;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }


  set newBornList(List<NewBorn>? value) {
    _newBornList = value;
    notifyListeners();
  }

  void getAllNewBorn() async {
    final _prefs = await getPreferences();
    newBornList = await ApiService.getAllNewBorn(_prefs.authToken!);
    loading = false;
  }

  Future<SharedPreferences> getPreferences() async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs!;
  }
}
