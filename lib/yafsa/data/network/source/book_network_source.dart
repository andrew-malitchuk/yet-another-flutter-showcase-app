import '../model/books_response_network_model.dart';

abstract class BookNetworkSource {
  Future<BooksResponseNetworkModel?> getBooks(int page);
  Future<BooksResponseNetworkModel?> getBook(int id);
  Future<BooksResponseNetworkModel?> getRecommendationBooks();
  Future<BooksResponseNetworkModel?> searchBooks(String query);
  Future<BooksResponseNetworkModel?> filterBooks(
      int page, bool copyright, bool sortAsc, List<String>? lang);
}
