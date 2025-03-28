import 'package:equatable/equatable.dart';

class FilterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialLoadFilterEvent extends FilterEvent {}

class CopyrightFilterEvent extends FilterEvent {
  final bool copyright;

  CopyrightFilterEvent(this.copyright);

  @override
  List<Object?> get props => [copyright];
}

class SortFilterEvent extends FilterEvent {
  final bool sortAsc;

  SortFilterEvent(this.sortAsc);

  @override
  List<Object?> get props => [sortAsc];
}

class LangFilterEvent extends FilterEvent {
  final List<String> lang;

  LangFilterEvent(this.lang);

  @override
  List<Object?> get props => [lang];
}

class PerformFilterEvent extends FilterEvent {
  @override
  List<Object?> get props => [];
}

class LoadMoreFilterEvent extends FilterEvent {
  @override
  List<Object?> get props => [];
}
