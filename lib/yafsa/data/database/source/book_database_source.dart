import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import '../model/book_database_model.dart';

abstract class BookDatabaseSource {
  Future<List<BookDatabaseModel>> getBooks();

  void addBook(BookDatabaseModel value);

  void addBooks(List<BookDatabaseModel> values);

  void saveBook(BookDatabaseModel value);

  void removeBook(int id);

  void deleteAll();

  ValueListenable<Box<BookDatabaseModel>> foo();

  void addToLibrary(BookDatabaseModel book);

  void removeFromLibrary(BookDatabaseModel book);

  bool contain(BookDatabaseModel book);
}
