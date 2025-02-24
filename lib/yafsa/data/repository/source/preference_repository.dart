abstract class PreferenceRepository {
  Future<String?> getString(String key);

  void setString(String key, String? value);

  void setBool(String key, bool? value);

  Future<bool?> getBool(String key);
}
