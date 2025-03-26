import 'package:equatable/equatable.dart';

class SearchEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialLoadSearchEvent extends SearchEvent {}

class QuerySearchEvent extends SearchEvent {
  final String query;

  QuerySearchEvent(this.query);

  @override
  List<Object?> get props => [query];
}
