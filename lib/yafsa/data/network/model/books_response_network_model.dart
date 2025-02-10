import 'package:json_annotation/json_annotation.dart';
import 'book_response_network_model.dart';

part "books_response_network_model.g.dart";

@JsonSerializable(explicitToJson: true)
class BooksResponseNetworkModel {
  final int count;
  final String? next;
  final String? previous;
  final List<BookResponseNetworkModel> results;

  BooksResponseNetworkModel({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory BooksResponseNetworkModel.fromJson(Map<String, dynamic> json) =>
      _$BooksResponseNetworkModelFromJson(json);

  Map<String, dynamic> toJson() => _$BooksResponseNetworkModelToJson(this);
}
