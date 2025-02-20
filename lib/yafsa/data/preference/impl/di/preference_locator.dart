import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../source/preference_data_source.dart';
import '../source/preference_data_source_impl.dart';

Future<void> initializePreferenceLocator() async {
  GetIt.instance.registerSingletonAsync<SharedPreferences>(() async {
    final preference = await SharedPreferences.getInstance();
    return preference;
  });

  GetIt.instance.registerSingletonAsync<PreferenceDataSource>(() async {
    await GetIt.instance.isReady<SharedPreferences>();
    var preference = GetIt.instance<SharedPreferences>();
    var dbSource = PreferenceDataSourceImpl(preference);
    return dbSource;
  });
}
