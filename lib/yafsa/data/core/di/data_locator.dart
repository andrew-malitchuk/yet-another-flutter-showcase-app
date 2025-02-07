import 'package:yafsa/yafsa/data/network/impl/di/network_locator.dart';

import '../../database/impl/di/database_locator.dart';
import '../../preference/impl/di/preference_locator.dart';
import '../../repository/impl/di/repository_locator.dart';

Future<void> initializeDataLocator() async {
  initializePreferenceLocator();
  await initializeDatabaseLocator();
  initializeNetworkLocator();
  initializeRepositoryLocator();
}
