import 'package:yafsa/yafsa/data/repository/model/books_repository_model.dart';

import '../model/book_repository_model.dart';

abstract class BookRepository {
  Future<BooksRepositoryModel?> getBooks(int page);
  Future<BooksRepositoryModel?> getBook(int id);
  Future<BooksRepositoryModel?> getRecommendationBooks(int limit);
  void addBook(BookRepositoryModel book);
  Future<List<BookRepositoryModel>> getLastSeenBooks(int limit);
  Future<BooksRepositoryModel?> searchBooks(String query);
  Future<BooksRepositoryModel?> filterBooks(
      int page, bool copyright, bool sortAsc, List<String>? lang);

  void saveBook(BookRepositoryModel book);
  void deleteBook(int id);

  List<BookRepositoryModel> changes();
  void addToLibrary(BookRepositoryModel book);
  void removeFromLibrary(BookRepositoryModel book);
  bool isInLibrary(BookRepositoryModel book);
}
