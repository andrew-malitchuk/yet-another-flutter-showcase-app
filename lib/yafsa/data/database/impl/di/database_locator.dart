import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:yafsa/yafsa/data/database/model/book_database_model.dart';

import '../../core/configure/database_configure.dart';
import '../../model/author_database_model.dart';
import '../../source/book_database_source.dart';
import '../source/book_database_source_impl.dart';

Future<void> initializeDatabaseLocator() async {
  Hive.registerAdapter(BookDatabaseModelAdapter());
  Hive.registerAdapter(AuthorDatabaseModelAdapter());

  GetIt.instance.registerSingletonAsync<Box<BookDatabaseModel>>(() async {
    var box = await Hive.openBox<BookDatabaseModel>(DatabaseConfigure.bookBox);
    return box;
  }, instanceName: 'bookBox');
  GetIt.instance.registerSingletonAsync<Box<BookDatabaseModel>>(
    () async {
      var box =
          await Hive.openBox<BookDatabaseModel>(DatabaseConfigure.libraryBox);
      return box;
    },
    instanceName: 'libraryBox',
  );

  GetIt.instance.registerSingletonAsync<BookDatabaseSource>(() async {
    await GetIt.instance
        .isReady<Box<BookDatabaseModel>>(instanceName: 'bookBox');
    await GetIt.instance
        .isReady<Box<BookDatabaseModel>>(instanceName: 'libraryBox');
    var bookBox =
        GetIt.instance<Box<BookDatabaseModel>>(instanceName: 'bookBox');
    var libraryBox =
        GetIt.instance<Box<BookDatabaseModel>>(instanceName: 'libraryBox');
    var dbSource = BookDatabaseSourceImpl(bookBox, libraryBox);
    return dbSource;
  });
}
