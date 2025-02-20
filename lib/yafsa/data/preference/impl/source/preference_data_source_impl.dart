import 'package:shared_preferences/shared_preferences.dart';

import '../../source/preference_data_source.dart';

class PreferenceDataSourceImpl implements PreferenceDataSource {
  final SharedPreferences _preferences;

  PreferenceDataSourceImpl(this._preferences);

  @override
  Future<String?> getString(String key) async {
    final value = _preferences.getString(key);
    return value;
  }

  @override
  void setString(String key, String? value) async {
    if (value == null) {
      _preferences.remove(key);
    } else {
      _preferences.setString(key, value);
    }
  }

  @override
  Future<bool?> getBool(String key) async {
    final value = _preferences.getBool(key);
    return value;
  }

  @override
  void setBool(String key, bool? value) async {
    if (value == null) {
      _preferences.remove(key);
    } else {
      _preferences.setBool(key, value);
    }
  }
}
