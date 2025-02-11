import 'package:json_annotation/json_annotation.dart';

import 'author_response_network_model.dart';

part "book_response_network_model.g.dart";

@JsonSerializable(explicitToJson: true)
class BookResponseNetworkModel {
  final int? id;
  final String? title;
  final List<AuthorResponseNetworkModel?>? authors;
  final List<String?>? summaries;
  final List<AuthorResponseNetworkModel?>?
      translators; // Empty array in JSON, kept dynamic for flexibility
  final List<String?>? subjects;
  final List<String?>? bookshelves;
  final List<String?>? languages;
  final bool? copyright;
  final String? mediaType;
  final Map<String, String?>? formats;
  final int? downloadCount;

  BookResponseNetworkModel({
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

  factory BookResponseNetworkModel.fromJson(Map<String, dynamic> json) =>
      _$BookResponseNetworkModelFromJson(json);
  Map<String, dynamic> toJson() => _$BookResponseNetworkModelToJson(this);
}
