import 'package:json_annotation/json_annotation.dart';

part "author_response_network_model.g.dart";

@JsonSerializable(explicitToJson: true)
class AuthorResponseNetworkModel {
  final String? name;
  final int? birthYear;
  final int? deathYear;

  AuthorResponseNetworkModel({
    required this.name,
    this.birthYear,
    this.deathYear,
  });

  factory AuthorResponseNetworkModel.fromJson(Map<String, dynamic> json) =>
      _$AuthorResponseNetworkModelFromJson(json);
  Map<String, dynamic> toJson() => _$AuthorResponseNetworkModelToJson(this);
}
