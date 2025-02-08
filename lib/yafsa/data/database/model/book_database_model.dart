import 'package:hive/hive.dart';

import '../core/configure/database_configure.dart';
import 'author_database_model.dart';

part 'book_database_model.g.dart';

@HiveType(typeId: DatabaseModel.book)
class BookDatabaseModel extends HiveObject {
  @HiveField(0)
  final int? id;

  @HiveField(1)
  final String? title;

  @HiveField(2)
  final List<AuthorDatabaseModel?>? authors;

  @HiveField(3)
  final List<String?>? summaries;

  @HiveField(4)
  final List<AuthorDatabaseModel?>? translators;

  @HiveField(5)
  final List<String?>? subjects;

  @HiveField(6)
  final List<String?>? bookshelves;

  @HiveField(7)
  final List<String?>? languages;

  @HiveField(8)
  final bool? copyright;

  @HiveField(9)
  final String? mediaType;

  @HiveField(10)
  final Map<String, String?>? formats;

  @HiveField(11)
  final int? downloadCount;

  BookDatabaseModel({
    required this.id,
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
    required this.downloadCount,
  });
}
