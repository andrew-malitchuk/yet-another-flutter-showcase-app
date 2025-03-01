import '../../data/repository/model/books_repository_model.dart';
import 'base/base_domain_model.dart';
import 'book_domain_model.dart';

class BooksDomainModel extends BaseDomainModel {
  final int count;
  final String next;
  final String previous;
  final List<BookDomainModel> results;

  BooksDomainModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });
}

extension BooksDomainModelMapper on BooksDomainModel {
  BooksRepositoryModel toRepositoryModel() {
    return BooksRepositoryModel(
        count: count,
        next: next,
        previous: previous,
        results: results.map((it) => it.toRepositoryModel()).toList());
  }
}

extension BooksRepositoryModelMapper on BooksRepositoryModel {
  BooksDomainModel toDomainModel() {
    return BooksDomainModel(
        count: count,
        next: next,
        previous: previous,
        results: results.map((it) => it.toDomainModel()).toList());
  }
}
