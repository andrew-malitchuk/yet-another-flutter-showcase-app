import 'package:hive/hive.dart';

import '../core/configure/database_configure.dart';

part "author_database_model.g.dart";

@HiveType(typeId: DatabaseModel.author)
class AuthorDatabaseModel extends HiveObject {
  @HiveField(0)
  final String? name;

  @HiveField(1)
  final int? birthYear;

  @HiveField(2)
  final int? deathYear;

  AuthorDatabaseModel({
    required this.name,
    this.birthYear,
    this.deathYear,
  });
}
