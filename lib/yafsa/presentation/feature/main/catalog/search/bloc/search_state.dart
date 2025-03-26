import 'package:yafsa/yafsa/domain/model/books_domain_model.dart';

abstract class SearchState {}

class SearchInitialState extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchErrorState extends SearchState {}

class SearchEmptyState extends SearchState {}

class SearchLoadedState extends SearchState {
  final BooksDomainModel result;

  SearchLoadedState(this.result);
}
