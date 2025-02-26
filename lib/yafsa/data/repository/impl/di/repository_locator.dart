import 'package:get_it/get_it.dart';
import 'package:yafsa/yafsa/data/database/source/book_database_source.dart';
import 'package:yafsa/yafsa/data/network/source/book_network_source.dart';
import 'package:yafsa/yafsa/data/preference/source/preference_data_source.dart';
import 'package:yafsa/yafsa/data/repository/impl/source/books_repository_impl.dart';
import 'package:yafsa/yafsa/data/repository/source/book_repository.dart';

import '../../source/preference_repository.dart';
import '../source/preference_repository_impl.dart';

void initializeRepositoryLocator() {
  GetIt.instance.registerSingletonAsync<BookRepository>(() async {
    await GetIt.instance.isReady<BookDatabaseSource>();
    var repository = BookRepositoryImpl(GetIt.instance<BookNetworkSource>(),
        GetIt.instance<BookDatabaseSource>());
    return repository;
  });
  GetIt.instance.registerSingletonAsync<PreferenceRepository>(() async {
    await GetIt.instance.isReady<PreferenceDataSource>();
    var repository =
        PreferenceRepositoryImpl(GetIt.instance<PreferenceDataSource>());
    return repository;
  });
}
