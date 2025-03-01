import '../../data/repository/model/book_repository_model.dart';
import 'author_domain_model.dart';
import 'base/base_domain_model.dart';

class BookDomainModel extends BaseDomainModel {
  final int id;
  final String title;
  final List<AuthorDomainModel> authors;
  final List<String> summaries;
  final List<AuthorDomainModel> translators;
  final List<String> subjects;
  final List<String> bookshelves;
  final List<String> languages;
  final bool copyright;
  final String mediaType;
  final Map<String, String> formats;
  final int downloadCount;
  bool isFavorite = false;

  BookDomainModel(
      {required this.id,
      required this.title,
      required this.authors,
      required this.summaries,
      required this.translators,
      required this.subjects,
      required this.bookshelves,
      required this.languages,
      required this.copyright,
      required this.mediaType,
      required this.formats,
      required this.downloadCount});
}

extension BookDomainModelMapper on BookDomainModel {
  BookRepositoryModel toRepositoryModel() {
    return BookRepositoryModel(
        id: id,
        title: title,
        authors: authors.map((e) => e.toRepositoryModel()).toList(),
        summaries: summaries,
        translators: translators.map((e) => e.toRepositoryModel()).toList(),
        subjects: subjects,
        bookshelves: bookshelves,
        languages: languages,
        copyright: copyright,
        mediaType: mediaType,
        formats: formats,
        downloadCount: downloadCount);
  }
}

extension BookRepositoryModelMapper on BookRepositoryModel {
  BookDomainModel toDomainModel() {
    return BookDomainModel(
        id: id,
        title: title,
        authors: authors.map((e) => e.toDomainModel()).toList(),
        summaries: summaries,
        translators: translators.map((e) => e.toDomainModel()).toList(),
        subjects: subjects,
        bookshelves: bookshelves,
        languages: languages,
        copyright: copyright,
        mediaType: mediaType,
        formats: formats,
        downloadCount: downloadCount);
  }
}
