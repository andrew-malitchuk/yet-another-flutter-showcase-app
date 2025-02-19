abstract class PreferenceDataSource {
  Future<String?> getString(String key);
  void setString(String key, String? value);
  Future<bool?> getBool(String key);
  void setBool(String key, bool? value);
}
