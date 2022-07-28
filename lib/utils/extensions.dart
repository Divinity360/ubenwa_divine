import 'package:shared_preferences/shared_preferences.dart';

String sharedPreferencesKey = 'sharedPreferencesKey';

extension SharedPreferencesDataExtension on SharedPreferences {
  Future setAuthToken(String value) async =>
      await setString(sharedPreferencesKey, value);

  String? get authToken => getString(sharedPreferencesKey);
}
