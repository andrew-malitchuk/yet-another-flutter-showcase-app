import 'dart:math';

import 'package:yafsa/yafsa/data/network/source/book_network_source.dart';
import 'package:yafsa/yafsa/data/repository/model/book_repository_model.dart';
import 'package:yafsa/yafsa/data/repository/model/books_repository_model.dart';

import '../../../database/source/book_database_source.dart';
import '../../source/book_repository.dart';

class BookRepositoryImpl extends BookRepository {
  final BookNetworkSource _bookNetworkSource;
  final BookDatabaseSource _bookDatabaseSource;

  BookRepositoryImpl(
    this._bookNetworkSource,
    this._bookDatabaseSource,
  );

  @override
  Future<BooksRepositoryModel?> getBooks(int page) async {
    final response = await _bookNetworkSource.getBooks(page);
    return response?.toRepositoryModel();
  }

  @override
  Future<BooksRepositoryModel?> getBook(int id) async {
    final response = await _bookNetworkSource.getBook(id);
    return response?.toRepositoryModel();
  }

  @override
  Future<BooksRepositoryModel?> getRecommendationBooks(int limit) async {
    final response = await _bookNetworkSource.getBooks(Random().nextInt(100));
    final limitedResults = (response?.results.take(limit).toList() ?? [])
        .map((it) => it.toRepositoryModel())
        .toList();
    return response?.toRepositoryModel().copyWith(results: limitedResults);
  }

  @override
  Future<List<BookRepositoryModel>> getLastSeenBooks(int limit) async {
    final response = await _bookDatabaseSource.getBooks();
    final limitedResults = (response.take(limit).toList() ?? [])
        .map((it) => it.toRepositoryModel())
        .toList();
    return limitedResults;
  }

  @override
  void addBook(BookRepositoryModel book) async {
    _bookDatabaseSource.addBook(book.toDatabaseModel());
  }

  @override
  Future<BooksRepositoryModel?> searchBooks(String query) async {
    final response = await _bookNetworkSource.searchBooks(query);
    return response?.toRepositoryModel();
  }

  @override
  Future<BooksRepositoryModel?> filterBooks(
      int page, bool copyright, bool sortAsc, List<String>? lang) async {
    final response =
        await _bookNetworkSource.filterBooks(page, copyright, sortAsc, lang);
    return response?.toRepositoryModel();
  }

  @override
  void deleteBook(int id) {
    _bookDatabaseSource.removeBook(id);
  }

  @override
  void saveBook(BookRepositoryModel book) {
    _bookDatabaseSource.saveBook(book.toDatabaseModel());
  }

  @override
  List<BookRepositoryModel> changes() {
    return _bookDatabaseSource
        .foo()
        .value
        .values
        .map((it) => it.toRepositoryModel())
        .toList();
  }

  @override
  void addToLibrary(BookRepositoryModel book) {
    _bookDatabaseSource.addToLibrary(book.toDatabaseModel());
  }

  @override
  void removeFromLibrary(BookRepositoryModel book) {
    _bookDatabaseSource.removeBook(book.id);
  }

  @override
  bool isInLibrary(BookRepositoryModel book) {
    return _bookDatabaseSource.contain(book.toDatabaseModel());
  }
}
