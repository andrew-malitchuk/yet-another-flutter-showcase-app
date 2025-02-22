import 'package:yafsa/yafsa/data/network/model/author_response_network_model.dart';
import 'package:yafsa/yafsa/data/repository/model/base/base_repository_model.dart';

import '../../database/model/author_database_model.dart';

class AuthorRepositoryModel extends BaseRepositoryModel {
  final String name;
  final int? birthYear;
  final int? deathYear;

  AuthorRepositoryModel({
    required this.name,
    required this.birthYear,
    required this.deathYear,
  });
}

extension AuthorRepositoryResponseNetworkModelMapper on AuthorRepositoryModel {
  AuthorResponseNetworkModel toNetworkModel() {
    return AuthorResponseNetworkModel(
        name: name, birthYear: birthYear, deathYear: deathYear);
  }
}

extension AuthorResponseNetworkRepositoryModelMapper
    on AuthorResponseNetworkModel {
  AuthorRepositoryModel toRepositoryModel() {
    return AuthorRepositoryModel(
        name: name ?? "", birthYear: birthYear, deathYear: deathYear);
  }
}

extension AuthorRepositoryDatabaseModelMapper on AuthorRepositoryModel {
  AuthorDatabaseModel toDatabaseModel() {
    return AuthorDatabaseModel(
        name: name, birthYear: birthYear, deathYear: deathYear);
  }
}

extension AuthorDatabaseRepositoryModelMapper on AuthorDatabaseModel {
  AuthorRepositoryModel toRepositoryModel() {
    return AuthorRepositoryModel(
        name: name ?? "", birthYear: birthYear, deathYear: deathYear);
  }
}
