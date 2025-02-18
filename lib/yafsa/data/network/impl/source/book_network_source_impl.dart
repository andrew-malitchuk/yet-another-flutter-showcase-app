import 'package:yafsa/yafsa/data/network/impl/service/book_network_service.dart';
import 'package:yafsa/yafsa/data/network/model/books_response_network_model.dart';

import '../../source/book_network_source.dart';

class BookNetworkSourceImpl implements BookNetworkSource {
  final BookNetworkService _bookNetworkService;

  BookNetworkSourceImpl(this._bookNetworkService);

  @override
  Future<BooksResponseNetworkModel?> getBooks(int page) async {
    return await _bookNetworkService.getBooks(page);
  }

  @override
  Future<BooksResponseNetworkModel?> getBook(int id) async {
    return await _bookNetworkService.getBook(id);
  }

  @override
  Future<BooksResponseNetworkModel?> getRecommendationBooks() async {
    // TODO fix
    return await _bookNetworkService.getBooks(1);
  }

  @override
  Future<BooksResponseNetworkModel?> searchBooks(String query) async {
    return await _bookNetworkService.searchBooks(query);
  }

  @override
  Future<BooksResponseNetworkModel?> filterBooks(
      int page, bool copyright, bool sortAsc, List<String>? lang) async {
    return await _bookNetworkService.filterBooks(
        page, copyright, sortAsc, lang);
  }
}
