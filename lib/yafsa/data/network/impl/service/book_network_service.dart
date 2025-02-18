import 'package:yafsa/yafsa/data/network/impl/core/dio_client.dart';
import 'package:yafsa/yafsa/data/network/model/books_response_network_model.dart';

class BookNetworkService {
  final DioClient _dioClient;

  BookNetworkService(this._dioClient);

  Future<BooksResponseNetworkModel?> getBooks(int page) async {
    final response = await _dioClient.dio.get("/books", queryParameters: {
      "page": page,
    });
    return BooksResponseNetworkModel.fromJson(response.data);
  }

  Future<BooksResponseNetworkModel?> getBook(int id) async {
    final response =
        await _dioClient.dio.get("/books", queryParameters: {"ids": id});
    return BooksResponseNetworkModel.fromJson(response.data);
  }

  Future<BooksResponseNetworkModel?> getRecommendationBooks() async {
    final response = await _dioClient.dio
        .get("/books", queryParameters: {"sort": "popular"});
    return BooksResponseNetworkModel.fromJson(response.data);
  }

  Future<BooksResponseNetworkModel?> searchBooks(String query) async {
    final response =
        await _dioClient.dio.get("/books", queryParameters: {"search": query});
    return BooksResponseNetworkModel.fromJson(response.data);
  }

  Future<BooksResponseNetworkModel?> filterBooks(
      int page, bool copyright, bool sortAsc, List<String>? lang) async {
    final queryParameters = {
      "page": page,
      "copyright": copyright,
      "sort": sortAsc ? "asc" : "desc",
    };
    if (lang != null) {
      queryParameters["languages"] = lang.join(",");
    }

    final response =
        await _dioClient.dio.get("/books", queryParameters: queryParameters);
    return BooksResponseNetworkModel.fromJson(response.data);
  }
}
