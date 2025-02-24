import 'package:yafsa/yafsa/data/preference/source/preference_data_source.dart';

import '../../source/preference_repository.dart';

class PreferenceRepositoryImpl extends PreferenceRepository {
  final PreferenceDataSource _preferenceDataSource;

  PreferenceRepositoryImpl(
    this._preferenceDataSource,
  );

  @override
  Future<bool?> getBool(String key) {
    final result = _preferenceDataSource.getBool(key);
    return result;
  }

  @override
  Future<String?> getString(String key) {
    final result = _preferenceDataSource.getString(key);
    return result;
  }

  @override
  void setBool(String key, bool? value) {
    _preferenceDataSource.setBool(key, value);
  }

  @override
  void setString(String key, String? value) {
    _preferenceDataSource.setString(key, value);
  }
}
