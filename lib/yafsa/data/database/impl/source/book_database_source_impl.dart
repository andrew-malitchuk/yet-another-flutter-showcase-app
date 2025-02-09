import 'package:flutter/src/foundation/change_notifier.dart';
import 'package:hive_flutter/adapters.dart';

import '../../model/book_database_model.dart';
import '../../source/book_database_source.dart';

class BookDatabaseSourceImpl implements BookDatabaseSource {
  final Box<BookDatabaseModel> _bookBox;
  final Box<BookDatabaseModel> _libraryBox;

  BookDatabaseSourceImpl(this._bookBox, this._libraryBox);

  @override
  Future<List<BookDatabaseModel>> getBooks() async {
    return _bookBox.values.toList();
  }

  @override
  void addBook(BookDatabaseModel value) async {
    await _bookBox.put(value.id, value);
  }

  @override
  void addBooks(List<BookDatabaseModel> values) async {
    for (var it in values) {
      addBook(it);
    }
  }

  @override
  void deleteAll() async {
    await _bookBox.clear();
  }

  @override
  void removeBook(int id) async {
    await _libraryBox.delete(id);
  }

  @override
  void saveBook(BookDatabaseModel value) async {
    await _libraryBox.put(value.id, value);
  }

  @override
  ValueListenable<Box<BookDatabaseModel>> foo() {
    return _libraryBox.listenable();
  }

  @override
  void addToLibrary(BookDatabaseModel book) {
    _libraryBox.put(book.id, book);
  }

  @override
  void removeFromLibrary(BookDatabaseModel book) {
    _libraryBox.delete(book.id);
  }

  @override
  bool contain(BookDatabaseModel book) {
    return _libraryBox.containsKey(book.id);
  }
}
