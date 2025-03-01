import '../../data/repository/model/author_repository_model.dart';
import 'base/base_domain_model.dart';

class AuthorDomainModel extends BaseDomainModel {
  final String name;
  final int? birthYear;
  final int? deathYear;

  AuthorDomainModel({
    required this.name,
    required this.birthYear,
    required this.deathYear,
  });
}

extension AuthorDomainModelMapper on AuthorDomainModel {
  AuthorRepositoryModel toRepositoryModel() {
    return AuthorRepositoryModel(
        name: name, birthYear: birthYear, deathYear: deathYear);
  }
}

extension AuthorRepositoryModelMapper on AuthorRepositoryModel {
  AuthorDomainModel toDomainModel() {
    return AuthorDomainModel(
        name: name, birthYear: birthYear, deathYear: deathYear);
  }
}
