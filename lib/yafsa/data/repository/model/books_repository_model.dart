import '../../network/model/books_response_network_model.dart';
import 'base/base_repository_model.dart';
import 'book_repository_model.dart';

class BooksRepositoryModel extends BaseRepositoryModel {
  final int count;
  final String next;
  final String previous;
  final List<BookRepositoryModel> results;

  BooksRepositoryModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  BooksRepositoryModel copyWith({
    int? count,
    String? next,
    String? previous,
    List<BookRepositoryModel>? results,
  }) {
    return BooksRepositoryModel(
      count: count ?? this.count,
      next: next ?? this.next,
      previous: previous ?? this.previous,
      results: results ?? this.results,
    );
  }
}

extension BooksRepositoryModelMapper on BooksRepositoryModel {
  BooksResponseNetworkModel toNetworkModel() {
    return BooksResponseNetworkModel(
        count: count,
        next: next,
        previous: previous,
        results: results.map((it) => it.toNetworkModel()).toList());
  }
}

extension BooksResponseNetworkModelMapper on BooksResponseNetworkModel {
  BooksRepositoryModel toRepositoryModel() {
    return BooksRepositoryModel(
        count: count,
        next: next ?? "",
        previous: previous ?? "",
        results: results.map((it) => it.toRepositoryModel()).toList());
  }
}
