import 'package:yafsa/yafsa/data/database/model/book_database_model.dart';
import 'package:yafsa/yafsa/data/repository/model/base/base_repository_model.dart';

import '../../network/model/book_response_network_model.dart';
import 'author_repository_model.dart';

class BookRepositoryModel extends BaseRepositoryModel {
  final int id;
  final String title;
  final List<AuthorRepositoryModel> authors;
  final List<String> summaries;
  final List<AuthorRepositoryModel> translators;
  final List<String> subjects;
  final List<String> bookshelves;
  final List<String> languages;
  final bool copyright;
  final String mediaType;
  final Map<String, String> formats;
  final int downloadCount;

  BookRepositoryModel(
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

extension BookRepositoryResponseNetwotkModelMapper on BookRepositoryModel {
  BookResponseNetworkModel toNetworkModel() {
    return BookResponseNetworkModel(
        id: id,
        title: title,
        authors: authors.map((e) => e.toNetworkModel()).toList(),
        summaries: summaries,
        translators: translators.map((e) => e.toNetworkModel()).toList(),
        subjects: subjects,
        bookshelves: bookshelves,
        languages: languages,
        copyright: copyright,
        mediaType: mediaType,
        formats: formats,
        downloadCount: downloadCount);
  }
}

extension BookResponseNetworkRepositoryModelMapper on BookResponseNetworkModel {
  BookRepositoryModel toRepositoryModel() {
    return BookRepositoryModel(
      id: id ?? 0,
      title: title ?? "",
      authors: authors == null
          ? []
          : authors
                  ?.where((it) => it != null)
                  .map((it) => it!.toRepositoryModel())
                  .toList() ??
              [],
      summaries: summaries == null
          ? []
          : summaries?.where((it) => it != null).map((it) => it!).toList() ??
              [],
      translators: translators == null
          ? []
          : translators
                  ?.where((it) => it != null)
                  .map((it) => it!.toRepositoryModel())
                  .toList() ??
              [],
      subjects: subjects == null
          ? []
          : subjects?.where((it) => it != null).map((it) => it!).toList() ?? [],
      bookshelves: bookshelves == null
          ? []
          : bookshelves?.where((it) => it != null).map((it) => it!).toList() ??
              [],
      languages: languages == null
          ? []
          : languages?.where((it) => it != null).map((it) => it!).toList() ??
              [],
      copyright: copyright ?? false,
      mediaType: mediaType ?? "",
      formats: formats == null
          ? {}
          : formats!.map((key, value) => MapEntry(key, value ?? "")),
      downloadCount: downloadCount ?? 0,
    );
  }
}

extension BookDatabaseRepositoryModelMapper on BookDatabaseModel {
  BookRepositoryModel toRepositoryModel() {
    return BookRepositoryModel(
      id: id ?? 0,
      title: title ?? "",
      authors: authors == null
          ? []
          : authors
                  ?.where((it) => it != null)
                  .map((it) => it!.toRepositoryModel())
                  .toList() ??
              [],
      summaries: summaries == null
          ? []
          : summaries?.where((it) => it != null).map((it) => it!).toList() ??
              [],
      translators: translators == null
          ? []
          : translators
                  ?.where((it) => it != null)
                  .map((it) => it!.toRepositoryModel())
                  .toList() ??
              [],
      subjects: subjects == null
          ? []
          : subjects?.where((it) => it != null).map((it) => it!).toList() ?? [],
      bookshelves: bookshelves == null
          ? []
          : bookshelves?.where((it) => it != null).map((it) => it!).toList() ??
              [],
      languages: languages == null
          ? []
          : languages?.where((it) => it != null).map((it) => it!).toList() ??
              [],
      copyright: copyright ?? false,
      mediaType: mediaType ?? "",
      formats: formats == null
          ? {}
          : formats!.map((key, value) => MapEntry(key, value ?? "")),
      downloadCount: downloadCount ?? 0,
    );
  }
}

extension BookRepositoryDatabaseModelMapper on BookRepositoryModel {
  BookDatabaseModel toDatabaseModel() {
    return BookDatabaseModel(
        id: id,
        title: title,
        authors: authors.map((e) => e.toDatabaseModel()).toList(),
        summaries: summaries,
        translators: translators.map((e) => e.toDatabaseModel()).toList(),
        subjects: subjects,
        bookshelves: bookshelves,
        languages: languages,
        copyright: copyright,
        mediaType: mediaType,
        formats: formats,
        downloadCount: downloadCount);
  }
}
