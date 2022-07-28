import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ubenwa/main.dart';
import 'package:ubenwa/models/newborns.dart';
import 'package:ubenwa/services/api_service.dart';
import 'package:ubenwa/services/background_service.dart';
import 'package:ubenwa/utils/extensions.dart';
import 'package:workmanager/workmanager.dart';

class NewBornProvider extends ChangeNotifier {
  bool _loading = false;
  bool _isBkgServiceActive = true;
  List<NewBorn>? _newBornList;
  SharedPreferences? _prefs;

  bool get loading => _loading;

  bool get isBkgServiceActive => _isBkgServiceActive;

  List<NewBorn>? get newBornList => _newBornList;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  set isBkgServiceActive(bool value) {
    _isBkgServiceActive = value;
    notifyListeners();
  }

  set newBornList(List<NewBorn>? value) {
    _newBornList = value;
    notifyListeners();
  }

  void getAllNewBorn() async {
    loading = true;
    final _prefs = await getPreferences();
    newBornList = await ApiService.getAllNewBorn(_prefs.authToken!);
    loading = false;
  }

  void toggleBkgService(bool toggleValue) {
    isBkgServiceActive = !_isBkgServiceActive;
    if (toggleValue) {
      BackgroundService.setupWorkManager(callbackDispatcher);
    } else {
      BackgroundService.cancelBackgroundTask();
    }
  }

  Future<SharedPreferences> getPreferences() async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs!;
  }
}
