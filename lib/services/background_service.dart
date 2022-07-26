import 'dart:developer';
import 'dart:io';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_android/shared_preferences_android.dart';
import 'package:shared_preferences_ios/shared_preferences_ios.dart';
import 'package:ubenwa/main.dart';
import 'package:ubenwa/providers/newborn_provider.dart';
import 'package:ubenwa/services/api_service.dart';
import 'package:ubenwa/utils/extensions.dart';
import 'package:workmanager/workmanager.dart';

class BackgroundService {
  static const periodicHttpRequestTask = "ubenwa.simplePeriodic1HourTask";

  /// Initialize and register workmanager with periodic http request task
  static Future<void> setupWorkManager(Function callbackDispatcher) async {
    await Workmanager().initialize(
      callbackDispatcher,
    );
    await Workmanager().registerPeriodicTask(
        periodicHttpRequestTask, periodicHttpRequestTask,
        frequency: const Duration(minutes: 15),
        initialDelay: const Duration(seconds: 1));
  }

  static void processBackgroundTask() {
    /// Register shared preferences on its platform level for background tasks
    if (Platform.isAndroid) SharedPreferencesAndroid.registerWith();
    if (Platform.isIOS) SharedPreferencesIOS.registerWith();

    executeBackgroundTask();
  }

  /// Run background task
  static void executeBackgroundTask() {
    Workmanager().executeTask((task, inputData) async {
      final _prefs = await SharedPreferences.getInstance();
      String? _authToken = _prefs.authToken;
      log(_authToken ?? 'null', name: 'AUTH');
      if (_authToken != null) {
        await ApiService.addNewborns(_authToken);
      }

      return Future.value(true);
    });
  }

  /// Cancel task running in the background
  static void cancelBackgroundTask() {
    Workmanager().cancelByUniqueName(periodicHttpRequestTask);
  }
}
